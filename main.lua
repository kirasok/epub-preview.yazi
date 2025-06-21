local M = {}

function M:peek(job)
	local cache = ya.file_cache(job)
	if not cache then
		return
	end

	if M:preload(job) == 1 then
		ya.image_show(cache, job.area)
		ya.preview_widget(job, {})
	end
end

function M:seek() end

function M:preload(job)
	local cache = ya.file_cache(job)
	if not cache or fs.cha(cache) then
		return 1
	end

	local size = math.min(rt.preview.max_width, rt.preview.max_height)

	-- First try to use `epub-thumbnailer` command
	local child, code = Command("epub-thumbnailer")
			:arg(tostring(job.file.url))
			:arg(tostring(cache))
			:arg(tostring(size))
			:spawn()

	if not child then
		-- If `epub-thumbnailer` command is not available, try to use `gnome-epub-thumbnailer` command
		-- gnome-epub-thumbnailer does not need a size
		child, code = Command("gnome-epub-thumbnailer")
				:arg(tostring(job.file.url))
				:arg(tostring(cache))
				:spawn()
		if not child then
			ya.err("spawn `gnome-epub-thumbnailer` command returns " .. tostring(code))
			return 0
		end
	end

	local status = child:wait()
	return status and status.success and 1 or 2
end

return M
