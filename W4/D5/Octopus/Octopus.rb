fishes_in_the_ocean = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#sluggish octupus:
largest_fish = fishes_in_the_ocean.first 
fishes_in_the_ocean.each do |fish1|
  fishes_in_the_ocean.each do |fish2|
    if fish1.length > fish2.length && fish1.length > largest_fish.length 
      largest_fish = fish1 
    end 
  end 
end 

return largest_fish

fishes = fishes_in_the_ocean

def dominant_octopus(array) #quick sort algo

  return array if array.length <= 1

  pivot = array.shift 

  #sort left and right 
  left = []
  right = []
  array.each do |el|
    case pivot.length <=> el.length 
    when -1 
      right << el 
    else 
      left << el  
    end 
  end 

  dominant_octopus(left) + [pivot] + dominant_octopus(right)
end 

return dominant_octopus(array).last #returns sorted arr 

#clever octopus:

fishes.inject do |accum, el|
  if el.length > accum.length
    el
  else
    accum
  end
end  

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(val, arr)
  arr.each.with_index do |tile, i|
    return i if tile == val 
  end  
end 

