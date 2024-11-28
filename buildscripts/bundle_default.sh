# --------------------------------------------------

if [ ! -f "deps" ]; then
  sudo rm -r deps
fi
if [ ! -f "prefix" ]; then
  sudo rm -r prefix
fi

./download.sh
./patch.sh

# --------------------------------------------------

if [ ! -f "scripts/ffmpeg" ]; then
  rm scripts/ffmpeg.sh
fi
cp flavors/default.sh scripts/ffmpeg.sh

# --------------------------------------------------

./build.sh

# --------------------------------------------------

zip -r default-arm64-v8a.jar                prefix/arm64-v8a/usr/local/lib/*.so
zip -r default-armeabi-v7a.jar              prefix/armeabi-v7a/usr/local/lib/*.so
zip -r default-x86.jar                      prefix/x86/usr/local/lib/*.so
zip -r default-x86_64.jar                   prefix/x86_64/usr/local/lib/*.so

md5sum *.jar
