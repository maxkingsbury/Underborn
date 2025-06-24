function clone_1d_array(arr) {
    var result = [];
    for (var i = 0; i < array_length(arr); i++) {
        array_push(result, arr[i]);
    }
    return result;
}