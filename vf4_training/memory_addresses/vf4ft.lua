FT_MEMORY_TABLE = {
    ['level_id'] = 0x0C2926DC,                                  -- 4 bytes
    ['game_state'] = 0x0C24313C,                                -- byte, 1 - intro, 2 - character select menu, 3 - gameplay
    ['game_sub_state'] = 0x0C243148,                            -- 2 bytes
    ['game_sub_state_timer'] = 0x0C292578,                      -- 2 byte
    ['game_timer'] = 0x0C292574,                                -- float
    ['rounds_counter'] = 0x0C2925D8,                            -- 2 bytes
    ['players_wins_counter'] = 0x0C2925D0,                      -- 2 bytes
    ['hit_type'] = 0x0C4220C4,                                  -- byte
    ['game_mode'] = 0x0C2925CC,                                 -- byte
    ['hitboxes'] = 0x0C292792,                                  -- byte
    ['combo_counter'] = 0x0C37C4E2,
    ['round_time_frames'] = 0x0C29256C,                         -- 2 bytes

    ['camera_zoom'] = 0x0C370D36,                               -- 2 bytes

    ['p1_health'] = 0x0C37BA40,                                 -- 2 bytes
    ['p1_frame_advantage'] = 0x0C37C406,                        -- 2 bytes
    ['p1_move_startup'] = 0x0C37C1BA,                           -- 2 bytes
    ['p1_move_damage'] = 0x0C37BCD0,                            -- 2 bytes
    ['p1_combo_damage'] = 0x0C37C4D0,                           -- 2 bytes
    ['p1_recovery_time_after_hit'] = 0x0C37BA42,                -- 2 bytes
    ['p1_idle_time'] = 0x0C37BD4C,                              -- 2 bytes
    ['p1_state'] = 0x0C4205D0,                                  -- 2 bytes
    ['p1_costume'] = 0x0C2926E8,                                -- byte
    ['p1_hit_state'] = 0x0C37BA35,                              -- 2 bytes
    ['p1_combo_counter'] = 0x0C37C4CE,                          -- byte
    ['p1_hit_counter'] = 0x0C37CB18,
    ['p1_player_controller'] = 0x0C37BA48,
    ['p1_hit_check'] = 0x0C37BBA0,                              -- byte
    ['p1_stance'] = 0x0C37BD48,                                 -- byte
    ['p1_change_move_a'] = 0x0C37BBF0,                          -- byte
    ['p1_change_move_b'] = 0x0C37BBF1,                          -- byte
    
    ['p2_health'] = 0x0C37C2AC,                                 -- 2 bytes
    ['p2_frame_advantage'] = 0x0C37BB9A,                        -- 2 bytes
    ['p2_move_startup'] = 0x0C37C582,                           -- 2 bytes
    ['p2_combo_damage'] = 0x0C37BC64,                           -- 2 bytes
    ['p2_recovery_time_after_hit'] = 0x0C37C2AE,                -- 2 bytes
    ['p2_idle_time'] = 0x0C37C5B8,                              -- 2 bytes
    ['p2_state'] = 0x0C4205E0,                                  -- byte
    ['p2_costume'] = 0x0C2926EC,                                -- byte
    ['p2_hit_state'] = 0x0C37C2A1,                              -- 2 bytes
    ['p2_hit_count'] = 0x0C37D18C,
    ['p2_block_counter'] = 0x0C43170C,                          -- 2 bytes
    ['p2_player_controller'] = 0x0C37C2B4,
    ['p2_hit_check'] = 0x0C37C40C,                              -- byte
    ['p2_stance'] = 0x0C37C5B4,
    ['p2_change_move_a'] = 0x0C37C45C,                          -- byte
    ['p2_change_move_b'] = 0x0C37C45D,                          -- byte
}

FT_MEMORY_TABLE.is_evo = false
FT_MEMORY_TABLE.is_ft = true


--- game_sub_state:  to other file
                -- 1  - reload level
                -- 5  - p2 cutscene before round 
                -- 7  - new round 
                -- 9  - round start delay before gameplay
                -- 10 - actual gameplay
                -- 11 - restart game
                -- 12 - draw
                -- 13 - replay
                -- 15 - to the next round
                -- 16 - no clip, no collision logic etc
                -- 18 - credits map