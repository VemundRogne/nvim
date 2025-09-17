local M = {}

function M.get_hostname()
	local handle = io.popen("hostname")
	if handle then
		local hostname = handle:read("*a"):gsub("%s+", "")
		handle:close()
		return hostname
	end
	return nil
end

return M
