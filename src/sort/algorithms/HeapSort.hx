package sort.algorithms;

import lib.util.Comparator;
import sort.algorithms.SortAlgorithm;

/**
 * This class is an implementation of "Heap Sort" algorithm.
 *
 * @link http://en.wikipedia.org/wiki/Heapsort
 * @link http://sortvis.org/algorithms/heapsort.html
 *
 * @generic T the type of the items to sort
 */
@:allow(sort.algorithms.IntroSort)
class HeapSort<T> extends SortAlgorithm<T>
{
    /**
     * Constructor to initialize a new HeapSort instance.
     *
     * @param Array<T>                 arr        the Array to sort
     * @param lib.util.Comparator<T> comparator the Comparator to use
     */
    private function new(arr:Array<T>, comparator:Comparator<T>):Void
    {
        super(arr, comparator);
    }

    /**
     * @{inherit}
     */
    public static function sort<G>(arr:Array<G>, comparator:Comparator<G>):Void
    {
        if (arr.length > 1) {
            var hsort:HeapSort<G> = new HeapSort<G>(arr, comparator);
            hsort.internalSort(Std.int( (arr.length / 2) - 1 ), arr.length - 1);
        }
    }

    /**
     * @{inherit}
     */
    private function internalSort(start:Int, end:Int):Void
    {
        while (start >= 0) {
            this.sift(start, this.arr.length);
            --start;
        }
        while (end > 0) {
            SortAlgorithm.swap(this.arr, end, 0);
            this.sift(0, end);
            --end;
        }
    }

    /**
     *
     */
    private function sift(start:Int, count:Int):Void
    {
        var root:Int = start;
        var child:Int;
        while ((child = (root * 2) + 1) < count) {
            if (child < count - 1 && this.comparator(this.arr[child], this.arr[child + 1]) < 0) {
                ++child;
            }
            if (this.comparator(this.arr[root], this.arr[child]) < 0) {
                SortAlgorithm.swap(this.arr, root, child);
                root = child;
            } else {
                return;
            }
        }
    }
}
