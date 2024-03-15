-- TODO: rewrite toogle buttons
Training = {}
Training.states = {}
Training.states.guard = false
Training.states.crouch = false
Training.states.tech_roll = false
Training.crouch_button_pressed = false
Training.guard_button_pressed = false

function Training.reset_states()
    for state, _ in pairs(Training.states) do
        Training.states[state] = false
    end
end

function Training.guard_standing()
    Training.reset_states()
    Training.states.guard = true
    Training.guard_button_pressed = true
end

function Training.guard_crouching()
    Training.reset_states()
    Training.states.guard = true
    Training.states.crouch = true
    Training.guard_button_pressed = true
    Training.crouch_button_pressed = true
end

function Training.tech_roll()
    Training.reset_states()
    Training.states.tech_roll = true
end

function Training.process_inputs()
    if Training.states.guard then
        INPUT.pressButtons(2, 1)
    elseif not Training.states.guard and Training.guard_button_pressed then
        INPUT.releaseButtons(2, 1)
        Training.guard_button_pressed = false
    end

    if Training.states.crouch then
        INPUT.pressButtons(2, 32)
    elseif not Training.states.crouch and Training.crouch_button_pressed then
        INPUT.releaseButtons(2, 32)
        Training.crouch_button_pressed = false
    end
end

function Training.reset_round()
    Training.reset_states()
    MEMORY.write16(GAME_ADDRESSES.game_sub_state, 7) 
    MEMORY.write16(GAME_ADDRESSES.rounds_counter, 0) 
    MEMORY.write16(GAME_ADDRESSES.players_wins_counter, 0) 
end

function Training.reload_level()
    Training.reset_states()
    MEMORY.write16(GAME_ADDRESSES.game_sub_state, 1) 
end

function Training.toggle_hitboxes()
    hitboxes = MEMORY.read8(GAME_ADDRESSES.hitboxes)

    if hitboxes == 0 then 
        MEMORY.write8(GAME_ADDRESSES.hitboxes, 2) -- to game_addresses.lua
    elseif hitboxes == 2 then
        MEMORY.write8(GAME_ADDRESSES.hitboxes, 0) 
    end
end

function Training.set_p2_as_cpu()
    MEMORY.write8(GAME_ADDRESSES.p2_player_controller, 33) 
end

function Training.set_p2_as_human()
    MEMORY.write8(GAME_ADDRESSES.p2_player_controller, 37) 
end

function Training.toggle_change_move_a(player)
    player_change_move_table_string = 'p' .. player ..'_change_move_a'
    if MEMORY.read8(GAME_ADDRESSES[player_change_move_table_string]) == 0 then
        flycast.memory.write8(GAME_ADDRESSES[player_change_move_table_string], -1)
    else
         flycast.memory.write8(GAME_ADDRESSES[player_change_move_table_string], 0)
    end
end

function Training.toggle_change_move_b(player)
    player_change_move_table_string = 'p' .. player ..'_change_move_b'
    if MEMORY.read8(GAME_ADDRESSES[player_change_move_table_string]) == 0 then
        flycast.memory.write8(GAME_ADDRESSES[player_change_move_table_string], 1)
    else
         flycast.memory.write8(GAME_ADDRESSES[player_change_move_table_string], 0)
    end
end