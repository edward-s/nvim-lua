local present, lightspeed = pcall(require, "lightspeed")
if not present then
	return
end

lightspeed.setup({
	ignore_case = true,
	jump_to_unique_chars = false,
})
