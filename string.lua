
local colornames = {
	[0] = "black",
	"red",
	"green",
	"yellow",
	"blue",
	"magenta",
	"cyan",
	"white",
	"rgb",
	"default",
}

local fgcodes, bgcodes = {}, {}
for i = 0, #colornames do
	local name = colornames[i]
	fgcodes[name] = tostring(30 + i)
	bgcodes[name] = tostring(40 + i)
end

local modecodes = {
	reset = 0,
	bold = 1,
	faint = 2,
	italic = 3,
	underline = 4,
	invert = 7,
	hide = 8,
}

--make a color code escape sequence
function string.ccode(...)
	local code = ""
	for i = 1, select("#", ...) do
		local modename = select(i, ...)
		print(modename)
		local mode = modecodes[modename]
		if mode then
			if mode == modecodes.reset then
				code = tostring(mode)
				break
			else
				if i > 1 then
					code = code..";"
				end
				code = code..tostring(mode)
			end
		else
			error(("invalid text mode '%s'"):format(modename))
		end
	end
	if code ~= modecodes.reset then
	end
	return "\027["..code.."m"
end

print(string.ccode("invert").."hello, world!"..string.ccode("reset"))
