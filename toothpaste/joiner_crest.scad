use <threads.scad>;

$fn = 150;

bore_diameter = 12.5;           // matches male thread root diameter
thread_major_diameter = 14.0;   // matches male thread OD
thread_pitch = 2.0;
thread_length = 16.0;
outer_diameter = 16.0;

module thread_fit_test() {
    difference() {
        // Outer shell for testing
        cylinder(h = thread_length, d = outer_diameter, center = false);
        
        // Bore to minor diameter
        cylinder(h = thread_length, d = bore_diameter, center = false);
        
        // Internal threads
        metric_thread(diameter = thread_major_diameter, pitch = thread_pitch, length = thread_length, internal = true);
    }
}

thread_fit_test();
