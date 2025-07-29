local dict = {}

-- 函数：读取翻译文件并生成字典
local function readTXT2Dict(file_path)
    local exact_dict = {}
    local file, err = io.open(file_path, "r")
    if not file then
        return exact_dict
    end

    for line in file:lines() do
        local key, value = line:match("^(.-)=(.-)$")
        if key and value then
            key = key:match("^%s*(.-)%s*$")
            value = value:match("^%s*(.-)%s*$")
            -- 处理 \r 和 \n
            key = key:gsub("\r", "\\r"):gsub("\n", "\\n")
            value = value:gsub("\r", "\\r"):gsub("\n", "\\n")
            exact_dict[key] = value
        end
    end

    file:close()
    return exact_dict
end

-- 初始化翻译字典
local function initializeTranslations()
    dict = readTXT2Dict("lockdown_zh.txt")
end

-- 替换文本函数
local function replace()
    if not dict or next(dict) == nil then
        return
    end

    -- 查找所有可能包含文本的 TextBlock 组件
    local texts = FindAllOf("TextBlock")
    -- print(texts, "\n")
    if texts and type(texts) == "table" then  -- 确保 texts 有效并且是一个表
        for _, text in pairs(texts) do
            -- print(text, "\n")
            if text and type(text) == "userdata" and text.Text and type(text.Text) == "userdata" then
                -- 安全调用 ToString 方法
                local success_to_string, original_text = pcall(function() return text.Text:ToString() end)
                -- print(success_to_string, original_text, "\n")
                if success_to_string and original_text and original_text ~= "" then
                    -- 跳过单个字母或数字的文本
                    if #original_text == 1 and original_text:find("[A-Za-z0-9]") then
                        goto continue
                    end

                    local sanitized_text = original_text:match("^%s*(.-)%s*$"):gsub("\r", "\\r"):gsub("\n", "\\n")
                    local new_text = dict[sanitized_text]
                    -- print(new_text, "\n")
                    if new_text then
                        local restored_text = new_text:gsub("\\r", "\r"):gsub("\\n", "\n")
                        -- print(restored_text, "\n")
                        if restored_text ~= original_text then
                            -- local ftext = FText(restored_text)
                            -- print(ftext)
                            -- text:SetText(ftext)
                            pcall(function() text:SetText(FText(restored_text)) end)

                        end
                    end
                end
            end
            ::continue::
        end
    end
end

-- 初始化翻译字典
initializeTranslations()

-- 延迟 500 毫秒后启动文本替换功能
LoopAsync(500, function()
    -- print(dict["0 PLAYERS BANNED"])
    replace()
end)
