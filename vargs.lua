
local function rep(v, n)
	n = n or 1
	if n > 0 then
		return v, vargs.rep(v, n - 1)
	end
end

return { rep = rep }
