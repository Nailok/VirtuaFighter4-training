require "vf4_training.global_variables"
require "vf4_training.memory_addresses.vf4evo"
require "vf4_training.memory_addresses.vf4ft"
require "vf4_training.frame_data.frame_data_overlay"
require "vf4_training.training.training_overlay"
require "vf4_training.players_info"
require "vf4_training.utils.utils"

function Overlay()
  if HIDE_UI then
      if (INPUT.getButtons(1) == 0xFFFFEFFF) then
        HIDE_UI = false
      end
  end

  if GAME_ADDRESSES ~= nil and HIDE_UI ~= true then
    PlayersInfo.initialize_values()
    FrameDataOverlay.start()
    TrainingOverlay.start()
    Training.process_inputs()
    ChangeCostume()
  end
end

function CheckRom()
  local rom_name = flycast.state.gameId

  if rom_name == 'VF4 FINAL TUNED JAPAN' then
    GAME_ADDRESSES = FT_MEMORY_TABLE
  elseif rom_name == 'VF4 EVOLUTION JAPAN' then
    GAME_ADDRESSES = EVO_MEMORY_TABLE
  end
end

function ChangeCostume()
  if MEMORY.read16(GAME_ADDRESSES.game_sub_state) == 3 then
    if (INPUT.getButtons(1) == 0xFFFFFFF8) and MEMORY.read8(GAME_ADDRESSES.p1_costume) == 0 then
      MEMORY.write8(GAME_ADDRESSES.p1_costume, 2)
    end

    if (INPUT.getButtons(1) == 0xFFFFFFF8) and MEMORY.read8(GAME_ADDRESSES.p1_costume) == 1 then
      MEMORY.write8(GAME_ADDRESSES.p1_costume, 3)
    end
  end
end

GAME_ADDRESSES = FT_MEMORY_TABLE

  flycast_callbacks = {
      start = CheckRom,
      overlay = Overlay
  }