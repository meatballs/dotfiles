function record-call --description 'record PipeWire CallRecorder loopback to ~/recordings/'
    set -l name (test (count $argv) -gt 0; and echo $argv[1]; or date +%Y-%m-%d-%H%M)
    set -l path "$HOME/recordings/$name.wav"
    echo "Recording → $path (Ctrl+C to stop)"
    pw-record --target CallRecorderOutput "$path"
end
