
set -x SBT_OPTS "-Xmx2048m \
-XX:ReservedCodeCacheSize=256m \
-XX:MaxHeapFreeRatio=30 -XX:MinHeapFreeRatio=10 \
-XX:MaxInlineLevel=20 \
--add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED"
