-- Nodes here
local function book_on_use(itemstack, user)
	local player_name = user:get_player_name()
	local meta = itemstack:get_meta()
	local title, text, owner = "", "", player_name
	local page, page_max, lines, string = 1, 1, {}, ""

	-- Backwards compatibility
	local old_data = minetest.deserialize(itemstack:get_metadata())
	if old_data then
		meta:from_table({ fields = old_data })
	end

	local data = meta:to_table().fields

	if data.owner then
		title = data.title
		text = data.text
		owner = data.owner

		for str in (text .. "\n"):gmatch("([^\n]*)[\n]") do
			lines[#lines+1] = str
		end

		if data.page then
			page = data.page
			page_max = data.page_max

			for i = ((lpp * page) - lpp) + 1, lpp * page do
				if not lines[i] then break end
				string = string .. lines[i] .. "\n"
			end
		end
	end

	local formspec
	if owner == player_name then
		formspec = "size[8,8]" .. default.gui_bg ..
			default.gui_bg_img ..
			"field[0.5,1;7.5,0;title;Title:;" ..
				minetest.formspec_escape(title) .. "]" ..
			"textarea[0.5,1.5;7.5,7;text;Contents:;" ..
				minetest.formspec_escape(text) .. "]" ..
			"button_exit[2.5,7.5;3,1;save;Save]"
	else
		formspec = "size[8,8]" .. default.gui_bg ..
			default.gui_bg_img ..
			"label[0.5,0.5;by " .. owner .. "]" ..
			"tablecolumns[color;text]" ..
			"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
			"table[0.4,0;7,0.5;title;#FFFF00," .. minetest.formspec_escape(title) .. "]" ..
			"textarea[0.5,1.5;7.5,7;;" ..
				minetest.formspec_escape(string ~= "" and string or text) .. ";]" ..
			"button[2.4,7.6;0.8,0.8;book_prev;<]" ..
			"label[3.2,7.7;Page " .. page .. " of " .. page_max .. "]" ..
			"button[4.9,7.6;0.8,0.8;book_next;>]"
	end

	minetest.show_formspec(player_name, "scrolls:unlabeled", formspec)
	return itemstack
end

minetest.register_on_player_receive_fields(function(player, form_name, fields)
	if form_name ~= "dungeon_crawl:scroll" or not fields.save or
			fields.title == "" or fields.text == "" then
		return
	end
	local inv = player:get_inventory()
	local stack = player:get_wielded_item()
	local new_stack, data
	if stack:get_name() ~= "dungeon_crawl:written_scroll" then
		local count = stack:get_count()
		if count == 1 then
			stack:set_name("dungeon_crawl:written_scroll")
		else
			stack:set_count(count - 1)
			new_stack = ItemStack("dungeon_crawl:written_scroll")
		end
	else
		data = minetest.deserialize(stack:get_metadata())
	end
	if not data then data = {} end
	data.title = fields.title
	data.text = fields.text
	data.owner = player:get_player_name()
	local data_str = minetest.serialize(data)
	if new_stack then
		new_stack:set_metadata(data_str)
		if inv:room_for_item("main", new_stack) then
			inv:add_item("main", new_stack)
		else
			minetest.add_item(player:getpos(), new_stack)
		end
	else
		stack:set_metadata(data_str)
	end
	player:set_wielded_item(stack)
end)
local S = dungeon_crawl.intllib
local sound_wood = default_node_sound_wood_defaults()
local sound_stone = default_node_sound_stone_defaults()
local sound_glass = default_node_sound_glass_defaults()
local sound_leaves = default_node_sound_leaves_defaults()

minetest.register_craftitem("dungeon_crawl:scroll", {
	inventory_image = "scroll.png",
	description = "Scroll",
	on_use = book_on_use,
})
minetest.register_craftitem("dungeon_crawl:written_scroll", {
	inventory_image = "scroll.png",
	description = "Scroll with text",
	on_use = book_on_use,
})

minetest.register_node(":dungeon_crawl:dudresser", {
    description = "Dungeon Dresser",
    sounds = default_node_sound_wood_defaults()
    
})
