require './mcp4821'
require './mcp3002'

class LEDBlightnessControl
  mcp4821 = MCP4821.new PiPiper::Spi::CHIP_SELECT_1
  mcp3002 = MCP3002.new PiPiper::Spi::CHIP_SELECT_0
  loop do
    begin
      dac = (mcp3002.single * 1.442 + 2620).to_i
      mcp4821.write dac
      p dac
    rescue Interrupt
      mcp4821.shdn
      break
    end
  end
end
