/**
 * Dominant Color Sort II (v1.03)
 * GoToLoop (2016-Jan-11)
 *
 * forum.Processing.org/two/discussion/14393/getting-the-dominant-color-of-an-image
 * StackOverflow.com/questions/34381536/sort-a-hashmap-by-the-integer-value-desc
 */
 
import java.util.Arrays;
import java.util.Comparator;
 
import java.util.Map;
import static java.util.Map.Entry;
import java.util.LinkedHashMap;
 
static final int QTY = 5, VARIATION = 50;
final color[] dominantArr = new color[QTY];
final Map<Integer, Integer> dominantMap =
new LinkedHashMap<Integer, Integer>(QTY, 1.0);
 
Map<Integer, Integer> map, sortedMap;
PImage pic;
int len;
 
void setup() {
  size(1050, 1050);
  noLoop();
 
  pic = loadImage("img.jpg");
  len = pic.pixels.length;
}
 
void draw() {
  background(pic);
 
  map = countColorsIntoMap(pic.pixels);
  sortedMap = sortMapByValues(map);
 
  dominantMap.clear();
  Arrays.fill(dominantArr, 0);
 
  println("\nUnique colors found:", map.size(), "\tfrom:", len, ENTER);
 
  int idx = 0;
  for (final Entry<Integer, Integer> colors : sortedMap.entrySet()) {
    dominantMap.put(dominantArr[idx] = colors.getKey(), colors.getValue());
    if (++idx == QTY)  break;
  }
 
  idx = 0;
  for (final Entry<Integer, Integer> colors : dominantMap.entrySet())
    println(idx++, "->", hex(colors.getKey(), 6), "\tcount:", colors.getValue());
 
  println();
  println(dominantMap, ENTER);
  println(dominantArr);
}
 
void mousePressed() {
  redraw = true;
}
 
PImage randomPixels(final PImage img, final int v) {
  final color p[] = img.pixels, d = 0400 - min(0400, abs(v));
 
  for (int i = 0; i != p.length; p[i++] = color(
    (color) random(d, 0400), 
    (color) random(d, 0400), 
    (color) random(d, 0400)));
 
  img.updatePixels();
  return img;
}
 
static final Map<Integer, Integer> countColorsIntoMap(final color... colors) {
  final Map<Integer, Integer> map = new HashMap<Integer, Integer>();
 
  for (color c : colors) {
    final Integer count = map.get(c |= #000000); // c &= ~#000000
    map.put(c, count == null? 1 : count + 1);
  }
 
  return map;
}
 
static final <K extends Comparable<K>, V extends Comparable<V>>
  Map<K, V> sortMapByValues(final Map<K, V> map)
{
  final int len = map.size(), capacity = ceil(len/.75) + 1;
  final Entry<K, V>[] arr = map.entrySet().toArray(new Entry[len]);
 
  Arrays.sort(arr, new Comparator<Entry<K, V>>() {
    @ Override public int compare(final Entry<K, V> e1, final Entry<K, V> e2) {
      final int sign = e2.getValue().compareTo(e1.getValue());
      return sign != 0? sign : e1.getKey().compareTo(e2.getKey());
    }
  });
 
  final Map<K, V> sortedMap = new LinkedHashMap<K, V>(capacity);
  for (final Entry<K, V> entry : arr)
    sortedMap.put(entry.getKey(), entry.getValue());
 
  return sortedMap;
}