if mouse_wheel_up(){
WeaponArrayIndex = WeaponArrayIndex + 1
if WeaponArrayIndex >= WeaponCount {WeaponArrayIndex = 0}
}

if mouse_wheel_down(){
WeaponArrayIndex = WeaponArrayIndex - 1
if WeaponArrayIndex <= 0 {WeaponArrayIndex = WeaponCount-1}
}
