#pragma once

#ifdef __cplusplus
#define EXPORT_C_FUNC extern "C" __attribute__((visibility("default"))) __attribute__((used))
#else
#define EXPORT_C_FUNC extern
#endif

EXPORT_C_FUNC void juce_init();
EXPORT_C_FUNC void juce_play_test_sound();
EXPORT_C_FUNC int juce_add(int a, int b);
EXPORT_C_FUNC int juce_apply_reverb_effect(const char* inputFile, const char* outputFile);
