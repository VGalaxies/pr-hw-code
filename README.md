# Pattern Recognition

## course

https://cs.nju.edu.cn/wujx/teaching_PR.html



## octave



### CLI

编写 script file

```octave
1;

function y = foo(a)
  y = (a+(a+1)/3*sqrt((8*a-1)/3))^(1/3)+(a-(a+1)/3*sqrt((8*a-1)/3))^(1/3);
endfunction

foo(3/4)
foo(1/8)
typeinfo(foo(3/4))
typeinfo(foo(1/8))
```

https://stackoverflow.com/questions/54013267/run-octave-script-file-containing-a-function-definition

注意后面的语句结尾没有分号

> 有分号有定义没有输出
>
> 没有分号既有定义又有输出

然后在命令行中键入

```
octave-workspace$ octave foo.m
```



### GUI

自己探索即可

- disp 输出
- plot 连续绘图
- stem 离散绘图



