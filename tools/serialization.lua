local type         = type
local error        = error
local tostring     = tostring
local mathType     = math.type
local stringPack   = string.pack
local stringUnpack = string.unpack
local stringSub    = string.sub
local tableConcat  = table.concat

---@class Serialization
local M = {}

local Number  = 'N'
local UInt8   = 'I'
local UInt16  = 'J'
local UInt32  = 'K'
local Int64   = 'L'
local Char1   = 'V'
local Char2   = 'W'
local Str8    = 'X'
local Str16   = 'Y'
local Str32   = 'Z'
local True    = 'T'
local False   = 'F'
local Nil     = '!'
local ArrayB  = '[' -- 开始一张数组的定义
local ArrayE  = ']' -- 结束一张数组的定义
local TableB  = 'B' -- 开始一张表的定义
local TableE  = 'E' -- 结束一张表的定义
local Ref     = 'R' -- 复用之前定义的字符串或表
local Custom  = 'C' -- 自定义数据

local RefStrLen = 4 -- 字符串长度大于此值时保存引用

local EndSymbol = { '<End>' }

---@alias Serialization.SupportTypes
---| number
---| string
---| boolean
---| table
---| nil

local function isArray(v)
    if v[1] == nil then
        return false
    end
    local len = #v
    if next(v, len) ~= nil then
        return false
    end
    return true
end

-- 将一个Lua值序列化为二进制数据。请勿做为长期存储方案，因为二进制数据可能会因为版本更新而不兼容。
---@param data Serialization.SupportTypes | nil
---@param hook? fun(value: table): Serialization.SupportTypes | nil, string?
---@param ignoreUnknownType? boolean
---@return string
function M.encode(data, hook, ignoreUnknownType)
    if data == nil then
        return ''
    end
    local buf = {}
    local refid = 0
    local tableMap = {}

    local function encode(value, disableHook)
        local ref = tableMap[value]
        if ref then
            buf[#buf+1] = Ref
            encode(ref)
            return
        end
        local tp = type(value)
        if tp == 'number' then
            if mathType(value) == 'integer' then
                if value >= 0 then
                    if value < (1 << 8) then
                        buf[#buf+1] = UInt8 .. stringPack('I1', value)
                        return
                    elseif value < (1 << 16) then
                        buf[#buf+1] = UInt16 .. stringPack('I2', value)
                        return
                    elseif value < (1 << 32) then
                        buf[#buf+1] = UInt32 .. stringPack('I4', value)
                        return
                    end
                end
                buf[#buf+1] = Int64 .. stringPack('j', value)
            else
                buf[#buf+1] = Number .. stringPack('n', value)
            end
        elseif tp == 'string' then
            local len = #value
            if len > RefStrLen then
                refid = refid + 1
                tableMap[value] = refid
            end
            if len == 1 then
                buf[#buf+1] = Char1 .. value
            elseif len == 2 then
                buf[#buf+1] = Char2 .. value
            elseif len < (1 << 8) then
                buf[#buf+1] = Str8 .. stringPack('s1', value)
            elseif len < (1 << 16) then
                buf[#buf+1] = Str16 .. stringPack('s2', value)
            elseif len < (1 << 32) then
                buf[#buf+1] = Str32 .. stringPack('s4', value)
            else
                error('不支持这么长的字符串！')
            end
        elseif tp == 'boolean' then
            if value then
                buf[#buf+1] = True
            else
                buf[#buf+1] = False
            end
        elseif tp == 'nil' then
            buf[#buf+1] = Nil
        elseif tp == 'table' then
            if hook and not disableHook then
                local newValue, tag = hook(value)
                if newValue ~= nil then
                    buf[#buf+1] = Custom
                    encode(newValue, true)
                    encode(tag or false, true)
                    return
                end
            end
            refid = refid + 1
            tableMap[value] = refid
            if isArray(value) then
                -- 数组
                buf[#buf+1] = ArrayB
                for i = 1, #value do
                    encode(value[i])
                end
                buf[#buf+1] = ArrayE
            else
                -- 哈希表
                buf[#buf+1] = TableB
                for k, v in next, value do
                    encode(k)
                    encode(v)
                end
                buf[#buf+1] = TableE
            end
        else
            if ignoreUnknownType then
                return
            end
            error('不支持的类型！' .. tostring(tp))
        end
    end

    encode(data)

    return tableConcat(buf)
end

-- 反序列化二进制数据为Lua值
---@param str string
---@param hook? fun(value: Serialization.SupportTypes, tag?: string): Serialization.SupportTypes | nil
---@return Serialization.SupportTypes | nil
function M.decode(str, hook)
    if str == '' then
        return nil
    end
    local index = 1
    local ref = 0
    local refMap = {}

    local function decode()
        local tp = stringSub(str, index, index)
        index = index + 1

        local value
        if tp == Number then
            value, index = stringUnpack('n', str, index)
            return value
        elseif tp == UInt8 then
            value, index = stringUnpack('I1', str, index)
            return value
        elseif tp == UInt16 then
            value, index = stringUnpack('I2', str, index)
            return value
        elseif tp == UInt32 then
            value, index = stringUnpack('I4', str, index)
            return value
        elseif tp == Int64 then
            value, index = stringUnpack('j', str, index)
            return value
        elseif tp == Char1 then
            value = stringSub(str, index, index)
            index = index + 1
            if #value > RefStrLen then
                ref = ref + 1
                refMap[ref] = value
            end
            return value
        elseif tp == Char2 then
            value = stringSub(str, index, index + 1)
            index = index + 2
            if #value > RefStrLen then
                ref = ref + 1
                refMap[ref] = value
            end
            return value
        elseif tp == Str8 then
            value, index = stringUnpack('s1', str, index)
            if #value > RefStrLen then
                ref = ref + 1
                refMap[ref] = value
            end
            return value
        elseif tp == Str16 then
            value, index = stringUnpack('s2', str, index)
            if #value > RefStrLen then
                ref = ref + 1
                refMap[ref] = value
            end
            return value
        elseif tp == Str32 then
            value, index = stringUnpack('s4', str, index)
            if #value > RefStrLen then
                ref = ref + 1
                refMap[ref] = value
            end
            return value
        elseif tp == True then
            return true
        elseif tp == False then
            return false
        elseif tp == Nil then
            return nil
        elseif tp == TableB then
            value = {}
            ref = ref + 1
            refMap[ref] = value
            while true do
                local k = decode()
                if k == EndSymbol then
                    break
                end
                local v = decode()
                assert(v ~= nil)
                ---@diagnostic disable-next-line: need-check-nil
                value[k] = v
            end
            return value
        elseif tp == TableE then
            return EndSymbol
        elseif tp == ArrayB then
            value = {}
            ref = ref + 1
            refMap[ref] = value
            local i = 0
            while true do
                local v = decode()
                if v == EndSymbol then
                    break
                end
                i = i + 1
                value[i] = v
            end
            return value
        elseif tp == ArrayE then
            return EndSymbol
        elseif tp == Ref then
            value = decode()
            value = refMap[value]
            return value
        elseif tp == Custom then
            ---@cast hook -?
            value = decode()
            ---@cast value -?
            local tag = decode()
            ---@cast tag string | false
            value = hook(value, tag or nil)
            return value
        else
            error('未知类型！' .. tostring(tp))
        end
    end

    local value = decode()
    assert(index == #str + 1)
    return value
end

return M
