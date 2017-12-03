n = gets.chomp.to_i

spiral = Array.new(2*n+3) {Array.new(2*n+3, 0)}

x = n+1
y = n+1
dir = 0

xlb = n+1
xrb = n+1
ylb = n+1
yrb = n+1

dx = [1, 0, -1, 0]
dy = [0, -1, 0, 1]

num = 1

spiral[x][y] = 1

while x != 2*n+1 or y != 2*n+1
        spiral[x][y] = spiral[x-1][y] + spiral[x-1][y-1] + spiral[x][y-1] + spiral[x+1][y-1] + spiral[x+1][y] + spiral[x+1][y+1] + spiral[x][y+1] + spiral[x-1][y+1] + spiral[x][y]
        num += 1
        x += dx[dir]
        y += dy[dir]
        if x < xlb then
                xlb = x
                dir += 1
        elsif x > xrb then
                xrb = x
                dir += 1
        elsif y < ylb then
                ylb = y
                dir += 1
        elsif y > yrb then
                yrb = y
                dir += 1
        end
        dir %= 4
end

width = spiral.flatten.max.to_s.size+2
puts spiral.map { |a| a.map { |i| i.to_s.rjust(width) }.join }
