-- title:  PONG
-- author: ChatGPT
-- desc:   Simple PONG game
-- script: lua

-- Initialize game variables
p1_x, p1_y = 10, 24
p2_x, p2_y = 230, 24
ball_x, ball_y = 120, 36
ball_dx, ball_dy = 1, 1
paddle_speed = 2
score1, score2 = 0, 0

function draw()
    cls(0) -- Clear screen

    -- Draw paddles
    rect(p1_x, p1_y, 2, 16, 12)
    rect(p2_x, p2_y, 2, 16, 12)

    -- Draw ball
    circ(ball_x, ball_y, 2, 11)

    -- Draw scores
    print(score1, 54, 5, 12)
    print(score2, 70, 5, 12)
end

function update()
    -- Player 1 movement
    if btn(0) then p1_y = p1_y - paddle_speed end
    if btn(1) then p1_y = p1_y + paddle_speed end

    -- Player 2 movement
    if btn(2) then p2_y = p2_y - paddle_speed end
    if btn(3) then p2_y = p2_y + paddle_speed end

    -- Ball movement
    ball_x = ball_x + ball_dx
    ball_y = ball_y + ball_dy

    -- Ball collision with top and bottom
    if ball_y < 0 or ball_y > 136 then
        ball_dy = -ball_dy
    end

    -- Ball collision with paddles
    if (ball_x < p1_x + 2 and ball_y > p1_y and ball_y < p1_y + 16) or
       (ball_x > p2_x - 2 and ball_y > p2_y and ball_y < p2_y + 16) then
        ball_dx = -ball_dx
    end

    -- Score update
    if ball_x < 0 then
        score2 = score2 + 1
        reset_ball()
    elseif ball_x > 240 then
        score1 = score1 + 1
        reset_ball()
    end
end

function reset_ball()
    ball_x, ball_y = 120, 36
    ball_dx = -ball_dx
end

function TIC()
    update()
    draw()
end

-- <TILES>
-- 001:eccccccccc888888caaaaaaaca888888cacccccccacc0ccccacc0ccccacc0ccc
-- 002:ccccceee8888cceeaaaa0cee888a0ceeccca0ccc0cca0c0c0cca0c0c0cca0c0c
-- 003:eccccccccc888888caaaaaaaca888888cacccccccacccccccacc0ccccacc0ccc
-- 004:ccccceee8888cceeaaaa0cee888a0ceeccca0cccccca0c0c0cca0c0c0cca0c0c
-- 017:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 018:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- 019:cacccccccaaaaaaacaaacaaacaaaaccccaaaaaaac8888888cc000cccecccccec
-- 020:ccca00ccaaaa0ccecaaa0ceeaaaa0ceeaaaa0cee8888ccee000cceeecccceeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <TRACKS>
-- 000:100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
-- </TRACKS>

-- <PALETTE>
-- 000:1a1c2c5d275db13e53ef7d57ffcd75a7f07038b76425717929366f3b5dc941a6f673eff7f4f4f494b0c2566c86333c57
-- </PALETTE>
