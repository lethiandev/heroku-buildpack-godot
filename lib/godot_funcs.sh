function download_godot_headless() {
  GODOT_HEADLESS_URL=https://downloads.tuxfamily.org/godotengine/3.2/alpha3/Godot_v3.2-alpha3_linux_headless.64.zip

  if [ ! -f $CACHE_DIR/godot_headless.64 ]; then
    output_section "Downloading Godot Headless Executable..."
    curl -s $GODOT_HEADLESS_URL -o godot-headless.zip || exit 1
    unzip -o godot-headless.zip
    cp Godot_v3.2-alpha3_linux_headless.64 $CACHE_DIR/godot_headless.64
    touch "$CACHE_DIR/._sc_"
  else
    output_section "Using cached Godot Headless executable"
  fi
}

function download_godot_templates() {
  GODOT_TEMPLATES_URL=https://downloads.tuxfamily.org/godotengine/3.2/alpha3/Godot_v3.2-alpha3_export_templates.tpz
  TEMPLATES_DEST="$CACHE_DIR/editor_data/templates/3.2.alpha3"

  if [ ! -f $TEMPLATES_DEST/webassembly_debug.zip ]; then
    output_section "Downloading Godot Templates..."
    curl -s $GODOT_TEMPLATES_URL -o godot-templates.zip || exit 1
    unzip -o godot-templates.zip
    mkdir -p $TEMPLATES_DEST
    cp templates/webassembly_debug.zip $TEMPLATES_DEST
    cp templates/webassembly_release.zip $TEMPLATES_DEST
  else
    output_section "Using cached Godot HTML5 Templates"
  fi
}

function export_godot_project() {
  OUTPUT_DEST="$BUILD_DIR/dist"

  output_section "Exporting Godot Project..."
  output_line "Target: '$BUILD_DIR/dist/index.html'"

  mkdir -p $OUTPUT_DEST
  $CACHE_DIR/godot_headless.64 --path "$BUILD_DIR" --export-debug HTML5 "$OUTPUT_DEST/index.html" || exit 1
}
