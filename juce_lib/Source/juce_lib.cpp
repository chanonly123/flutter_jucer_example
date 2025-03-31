#include "juce_lib.h"
#include <JuceHeader.h>

int juce_add(int a, int b) {
    return a + b;
}

int juce_apply_reverb_effect(const char* inputFile, const char* outputFile) {
    DBG("juce_processAudioFile start");

    juce::AudioFormatManager formatManager;
    formatManager.registerBasicFormats();
    std::unique_ptr<juce::AudioFormatReader> reader(formatManager.createReaderFor(juce::String(inputFile)));

    if (!reader) {
        DBG("Failed to read input file!");
        return 1;
    }

    juce::AudioBuffer<float> buffer(reader->numChannels, (int)reader->lengthInSamples);
    reader->read(&buffer, 0, (int)reader->lengthInSamples, 0, true, true);

    // Apply Reverb effect
    juce::Reverb reverb;
    juce::Reverb::Parameters params;
    params.roomSize = 0.5f;
    params.wetLevel = 0.2f;
    params.dryLevel = 0.2f;
    reverb.setParameters(params);
    for (int i=0; i<reader->numChannels; i++) {
        reverb.processStereo(buffer.getWritePointer(i), buffer.getWritePointer(i), buffer.getNumSamples());
    }

    // Write output file
    juce::File outFile(outputFile);
    outFile.deleteFile();
    juce::WavAudioFormat wavFormat;
    std::unique_ptr<juce::FileOutputStream> outputStream(juce::File(outputFile).createOutputStream());
    if (!outputStream) {
        DBG("Failed to create output file!");
        return 2;
    }

    std::unique_ptr<juce::AudioFormatWriter> writer(wavFormat.createWriterFor(
                                                                              outputStream.get(), reader->sampleRate, buffer.getNumChannels(), 16, {}, 0));

    if (!writer) {
        DBG("Failed to create writer!");
        return 3;
    }
    
    outputStream.release();
    writer->writeFromAudioSampleBuffer(buffer, 0, buffer.getNumSamples());

    DBG("juce_processAudioFile complete!");
    return 0;
}
