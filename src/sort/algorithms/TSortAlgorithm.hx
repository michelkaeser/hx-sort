package sort.algorithms;

import lib.util.Comparator;

/**
 * The SortAlgorithm typedef defines the public API one sort algorithm
 * must offer, so the sort.Sorter class can use it.
 *
 * Since we use static methods for our sorters and it is not allowed to define
 * them inside interfaces, we use a typedef instead.
 */
typedef TSortAlgorithm =
{
    /**
     * Sorts the given Array by using the passed Comparator to compare the items.
     *
     * This should be used as a wrapper function around internalSort() that checks if the Array length
     * is zero or greater. If it is zero, nothing is done.
     * Also, for recursive functions the Array/Comparator should be stored in a property, so it
     * doesn't need to be passed between each recursive call. It is recommended to
     * extend sort.algorithms.SortAlgorithm in that case.
     *
     * @param Array<T>               arr        the Array to sort
     * @param lib.util.Comparator<T> comparator the Comparator to use
     */
    function sort<T>(arr:Array<T>, comparator:Comparator<T>):Void;
}
