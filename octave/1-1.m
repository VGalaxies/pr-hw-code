1;

function y = foo(a)
  y = (a+(a+1)/3*sqrt((8*a-1)/3))^(1/3)+(a-(a+1)/3*sqrt((8*a-1)/3))^(1/3);
endfunction

foo(3/4)
foo(1/8)
typeinfo(foo(3/4))
typeinfo(foo(1/8))