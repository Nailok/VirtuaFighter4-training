require "vf4_training.training.training"

TrainingOverlay = {}
TrainingOverlay.is_shown = true

function TrainingOverlay.start()
    TrainingOverlay.main_menu()
end

function TrainingOverlay.main_menu()
    if MEMORY.read16(GAME_ADDRESSES.game_sub_state) == 10 and MEMORY.read8(GAME_ADDRESSES.game_mode) == 2 then --- to game_values.lua (if round_start and real_players == 2)
        TrainingOverlay.create_main_menu_ui()
    end
end

function TrainingOverlay.create_main_menu_ui()
    local ui = flycast.ui
    local frame_data_width = 200
    local frame_data_height = 0
    local frame_data_y = math.floor((STATE.display.height / 4))
    local frame_data_x = math.floor((STATE.display.width / 12) - (frame_data_width / 4))
    ui.beginWindow("Training", frame_data_x, frame_data_y, frame_data_width, frame_data_height)
        ui.button('Guard', function() Training.guard_standing() end)
        ui.button('Crouch Guard', function() Training.guard_crouching() end)
        ui.button('Neutral', function() Training.reset_states() end)
        ui.button('Toggle hitboxes', function() Training.toggle_hitboxes() end)
        ui.button('Toggle p1 A moves', function() Training.toggle_change_move_a(1) end)
        ui.button('Toggle p1 B moves', function() Training.toggle_change_move_b(1) end)
        ui.button('Toggle p2 A moves', function() Training.toggle_change_move_a(2) end)
        ui.button('Toggle p2 B moves', function() Training.toggle_change_move_b(2) end)
        ui.button('Turn off UI', function() HIDE_UI = true end)
        ui.text('Use service button to')
        ui.text('turn on UI again')
        TrainingOverlay.debug_data(ui)
    ui.endWindow()
end

function TrainingOverlay.debug_data(ui)
    if DEBUG == false then
        return
    end

    ui.button('Set p2 as CPU', function() Training.set_p2_as_cpu() end)
    ui.button('Set p2 as Human', function() Training.set_p2_as_human() end)
    ui.button('Reset rounds', function() Training.reset_round() end)
    ui.button('Reload level', function() Training.reload_level() end)
    ui.button('Show hitboxes with model', function() Training.show_hitboxes_with_models() end)
end