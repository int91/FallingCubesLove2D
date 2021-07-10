local Entity = {}

function Entity:new(x, y, width, height, id, layer)
	local entity = {}
	entity.x = x
	entity.y = y
	entity.width = width
	entity.height = height
	entity.id = entityNumber
	entity.layer = layer or 0
	entity.tag = ""

	function entity:load()end
	function entity:update()end
	function entity:draw()end
	function entity:destroy()
		for q in pairs (entities) do
            if (entities[q] == entity) then
                if (entities[q].id == entity.id) then
                    table.remove(entities, q)
                end
            end
        end
	end

	table.insert(entities, entity)
	return entity
end

return Entity