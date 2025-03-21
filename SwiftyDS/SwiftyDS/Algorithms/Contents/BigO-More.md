### Time/Memory Complexity - Big O Notation
It is a way to generalize the **O**rder of growth of your algorithm. It is not an exact measurement, but a way to categorize your algorithm based on how it scales over different inputs. It helps to make performance and structure decisions over your algorithm to create the best possible program. 

> [!NOTE]- Note
> IRL that's not a real trade-off, as neither memory nor time is infinite and there could be a number of other variables like how things work under-the-hood, true use-case scenarios and other possibililites that could influence a real life decision. it is however a good and fast way to measure on how it will scale and works.


In other words: As your input grows, how fast does the computation or memory grow?

 ```Swift 
 func sumASCIICodes(n: String) -> Int {
 	let nChars = Array(n)
 	var sum = 0
 	
 	for i in 0..<nChars.count {
 		sum += Int(nChars[i].asciiValue ?? 0)
 	}
 	
 	return sum
 }
 ```

We can easily see how the size of N afects a LOT on how long it would take, if it is a single social media post it would be really fast, but if the string is book long it would take waay more time. But the question about it's complexity is not on who, but on how? How does it affect? In this example we can see it is in a linear way, a 2 char long string would be (in theory) twice as long as a single char string. So the **O**rder of how it will grow is *O(n)*, which means it will grow as N will grow.

There is a lil bit of cheatcode here you might have noticed! The easiest way to tell the Order of the functions is to look at the loops, as it usually tells us it's growth

```Swift 
 func doubleSumASCIICodes(n: String) -> Int {
 	let nChars = Array(n)
 	var sum = 0
 	
 	for i in 0..<nChars.count {
 		sum += Int(nChars[i].asciiValue ?? 0)
 	}
 	for i in 0..<nChars.count {
 		sum += Int(nChars[i].asciiValue ?? 0)
 	}
 	
 	return sum
 }
 ```

Here we could say the complecity is O(2N), however since it only matter the order of how it will scale, we don't need to care about constants, it is still a linear order if it is 1N, 2N,10N or ever 1000N it still a linear growth.

>[!NOTE]- Note
>Of course IRL this would matter a whole bunch! If you are comparing a O(1N) to a O(3N) algorithm, the first one will be a faster one. In some cases like if a N is very small a O(N^2) would be faster than a O(100N).

#### Important Complexities
![Chart with graphs for each BigO](BigO-Chart)

##### O(1)

This means constant time. In other words, no matter what your input is, the complexity is always the same

Famous Algorithms:
- 

##### O(logn)

>[!EXAMPLE]- Example
>```Swift
>```

Famous Algorithms:
- Mergesort

##### O(n)

Also known as Linear.

>[!EXAMPLE]- Example
>```Swift
>```

Famous Algorithms:
- Bubblesort

##### O(nlogn)

>[!EXAMPLE]- Example
>```Swift
>```

Famous Algorithms:
- Quicksort

##### O(n^2)

Also known as Squared.

>[!EXAMPLE]- Example
>```Swift
>func on2Sum(n: String) -> Int {
>   let nChars = Array(n)
>   var sum = 0
>   
>   for i in 0..<nChars.count {
>       for j in 0..<nChars.count {
>           sum += Int(nChars[j].asciiValue ?? 0)
>       }
>    }
>    
>    return sum
>}
>```

Famous Algorithms:
- 

##### O(2^n)

>[!EXAMPLE]- Example
>```Swift
>```

Famous Algorithms:
- 

##### O(n!)

>[!EXAMPLE]- Example
>```Swift
>```

Famous Algorithms:
- 
