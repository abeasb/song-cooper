# COOPER/COOPER/COOPER_1

cooper = "C:/Users/adria/OneDrive/Escritorio/sonic pi/samples/Twin Peaks The Owls Are Not What They Seem.mp3"

define :play_sample_with_reverb do
  with_fx :reverb, room: 0.6, mix: 0.7 do
    sample cooper, amp: 1
  end
end

live_loop :cooper do
  play_sample_with_reverb
  sleep sample_duration(cooper)
end

live_loop :ambient_pad do
  amp = 0.1
  use_synth :prophet
  notes = [:e3, :a3, :d4, :g3]
  
  notes.each do |note|
    play note, attack: 2, release: 8, cutoff: 80, amp: amp
    sleep 4
  end
end

live_loop :drone do
  use_synth :dark_ambience
  play :e2, attack: 4, release: 12, amp: 0.3
  sleep 16
end

live_loop :water_drops do
  with_fx :echo, mix: 0.3, phase: 0.25 do
    sample :elec_ping, rate: 1.5, amp: 0.1
  end
  sleep 3
end