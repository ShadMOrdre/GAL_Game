--stolen from builtin. LGPLv2.1

if not vector.dot
then
	function vector.dot(a, b)
		return a.x * b.x + a.y * b.y + a.z * b.z
	end
end

if not vector.cross
then
	function vector.cross(a, b)
		return {
			x = a.y * b.z - a.z * b.y,
			y = a.z * b.x - a.x * b.z,
			z = a.x * b.y - a.y * b.x
		}
	end
end

if not vector.angle
then
	function vector.angle(a, b)
		local dotp = vector.dot(a, b)
		local cp = vector.cross(a, b)
		local crossplen = vector.length(cp)
		return math.atan2(crossplen, dotp)
	end
end
