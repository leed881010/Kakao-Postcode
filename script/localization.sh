# Configuration
EN_SOURCE_PATH="../Libraries/ALLocalization/Sources/ALLocalization/Resources/en.lproj/Localizable.strings"
DESTINATION_PATH="../Libraries/ALLocalization/Sources/ALLocalization/Resources/Base.lproj"
BASE_SOURCE_PATH="$DESTINATION_PATH/Localizable.strings"
LAURINE_PATH="../Libraries/Laurine/LaurineGenerator.swift"
OUTPUT_PATH="../Libraries/ALLocalization/Sources/ALLocalization/Localizations.swift"

replaceBaseString() {
    # BASE 언어 파일을 EN 언어 파일로 교체한다.
    if [ -f "$BASE_SOURCE_PATH" ]; then
        rm -f "$BASE_SOURCE_PATH"
        cp -f "$EN_SOURCE_PATH" "$DESTINATION_PATH"
        echo "성공] 파일 교체"
    else
        echo "실패] 파일 교체"
    fi
}

regenerate() {
    chmod 755 "$LAURINE_PATH"
    if [ -f "$OUTPUT_PATH" ]; then
        echo "성공] OUTPUT_PATH 존재"
    else
        echo "성공] OUTPUT_PATH 없음"
    fi
    
    if [ -f "$EN_SOURCE_PATH" ]; then
        echo "성공] EN_SOURCE_PATH 존재"
    else
        echo "성공] EN_SOURCE_PATH 없음"
    fi
    
    
    if [ "$OUTPUT_PATH" -ot "$EN_SOURCE_PATH" ]; then
        "$LAURINE_PATH" -i "$EN_SOURCE_PATH" -o "$OUTPUT_PATH"
        echo "성공] Localizations 생성"
    else
        echo "실패] Localizations 생성"
    fi
}

replaceBaseString
regenerate
