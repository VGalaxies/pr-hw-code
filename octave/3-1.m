1;

function [out_index, distance] = nearest_neighbour(in_index, data)
  dimension = size(data, 1); # col
  num = size(data, 2); # row

  distance = realmax;
  for i = 1:num
    if (i != in_index)
      temp = sqrt(sumsq(data(:, in_index) - data(:, i)));
      if (temp < distance)
        distance = temp;
        out_index = i;
      endif
    endif
  endfor
endfunction

function [out_index, distance] = vl_nearest_neighbour(in_index, data, kdtree, cmp)
  [out_index_list, distance_list] = vl_kdtreequery(kdtree, data, data(:, in_index), "NumNeighbors", 2, 'MaxComparisons', cmp);
  out_index = out_index_list(2);
  distance = distance_list(2);
endfunction

##st = time();
##for i = 1:num
##  [out_index, distance] = nearest_neighbour(i, data);
##endfor
##ed = time();
##disp(ed - st);

##st = time();
##for i = 1:num
##  [out_index, distance] = vl_nearest_neighbour(i, data, kdtree, 6000);
##endfor
##ed = time();
##disp(ed - st);

num = 5000;
dimension = 10;
data = rand(dimension, num);
kdtree = vl_kdtreebuild(data, 'NumTrees', 1);

##cmp_list = [];
##wrong_rate_list = [];
##
##for index = 1:500
##  cmp = 10 * index;
##  cmp_list(index) = cmp;
##  
##  wrong_num = 0;
##  for i = 1:num
##    [out_index, distance] = nearest_neighbour(i, data);
##    [out_index_ann, distance_ann] = vl_nearest_neighbour(i, data, kdtree, cmp);
##    if (out_index != out_index_ann)
##      wrong_num++;
##    endif
##  endfor
##  wrong_rate = wrong_num / num;
##  wrong_rate_list(index) = wrong_rate;
##endfor

##plot(cmp_list, wrong_rate_list);
##xlabel('MaxComparisons');
##ylabel('Wrong-Rate');

cmp_list = [];
duration_list = [];

for index = 1:500
  index
  cmp = 10 * index;
  cmp_list(index) = cmp;
  
  st = time();
  for i = 1:num
    [out_index_ann, distance_ann] = vl_nearest_neighbour(i, data, kdtree, cmp);
  endfor
  ed = time();
  duration = ed - st;
  duration_list(index) = duration;
endfor

plot(cmp_list, duration_list);
xlabel('MaxComparisons');
ylabel('Duration');

##num_list = [];
##duration_list = [];
##
##for index = 1:100
##  num = index * 500;
##  num_list(index) = num;
##  
##  dimension = 10;
##  data = rand(dimension, num);
##  kdtree = vl_kdtreebuild(data, 'NumTrees', 1);
##  
##  st = time();
##  for i = 1:num
##    [out_index, distance] = vl_nearest_neighbour(i, data, kdtree, num);
##  endfor
##  ed = time();
##  duration = ed - st;
##  duration_list(index) = duration;
##endfor
##
##plot(num_list, duration_list);
##xlabel('Number');
##ylabel('Duration');