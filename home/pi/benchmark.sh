#FOR THIS BENCHMARK TO WORK YOU NEED TO HAVE SYSBENCH AND SPEEDTEST-CLI INSTALLED
sudo apt-get install sysbench speedtest-cli

#=================================== CONFIG ====================================

#SET THE NUMBER OF CORES/THREADS FOR THE MULTICORE AND PRIME NUMBERS FOR THE CPU BENCHMARK
cores_number_max="4"
smaller_primes="10000"
bigger_primes="100000"

#SET FILESIZE FOR IO BENCHMARK
io_filesize="1024"

#SET OUTPUT FILENAME
output_filename="Benchmark_Output"

#===============================================================================

clear
echo "$(tput bold)[ $(date "+%H:%M:%S") ] $(tput setaf 2)$(tput bold)[ Beginning Benchmark ]$(tput sgr0)
";
echo "
+---------------+
| CPU BENCHMARK |
+---------------+


" > $output_filename.txt;
#CPU BENCHMARKS
echo "$(tput bold)[ $(date "+%H:%M:%S") ] $(tput setaf 2)$(tput bold)Starting CPU Benchmark.....$(tput sgr0) | $(tput sgr 0 1)1 Thread$(tput sgr0) calculates all primes to $(tput sgr 0 1)$smaller_primes$(tput sgr0)";
echo "
Calculated all primes up to $smaller_primes with 1 Thread/Core" >> $output_filename.txt
sysbench --test=cpu --num-threads=1 --cpu-max-prime=$smaller_primes run | grep "total time:" >> $output_filename.txt;
echo "$(tput bold)[ $(date "+%H:%M:%S") ] $(tput setaf 2)$(tput bold)Starting CPU Benchmark.....$(tput sgr0) | $(tput sgr 0 1)1 Thread$(tput sgr0) calculates all primes to $(tput sgr 0 1)$bigger_primes$(tput sgr0)";
echo "
Calculated all primes up to $bigger_primes with 1 Thread/Core" >> $output_filename.txt
sysbench --test=cpu --num-threads=1 --cpu-max-prime=$bigger_primes run | grep "total time:" >> $output_filename.txt;
echo "$(tput bold)[ $(date "+%H:%M:%S") ] $(tput setaf 2)$(tput bold)Starting CPU Benchmark.....$(tput sgr0) | $(tput sgr 0 1)$cores_number_max Threads$(tput sgr0) calculates all primes to $(tput sgr 0 1)$smaller_primes$(tput sgr0)";
echo "
Calculated all primes up to $smaller_primes with $cores_number_max Threads/Cores" >> $output_filename.txt
sysbench --test=cpu --num-threads=$cores_number_max --cpu-max-prime=$smaller_primes run | grep "total time:" >> $output_filename.txt;
echo "$(tput bold)[ $(date "+%H:%M:%S") ] $(tput setaf 2)$(tput bold)Starting CPU Benchmark.....$(tput sgr0) | $(tput sgr 0 1)$cores_number_max Threads$(tput sgr0) calculates all primes to $(tput sgr 0 1)$bigger_primes$(tput sgr0)";
echo "
Calculated all primes up to $bigger_primes with $cores_number_max Threads/Cores" >> $output_filename.txt
sysbench --test=cpu --num-threads=$cores_number_max --cpu-max-prime=$bigger_primes run | grep "total time:" >> $output_filename.txt;
echo "


================================================================================

+--------------+
| IO BENCHMARK |
+--------------+


" >> $output_filename.txt;
#IO READ/WRITE SPEEDS
echo "
$(tput bold)[ $(date "+%H:%M:%S") ] $(tput setaf 2)$(tput bold)Starting IO Benchmark......$(tput sgr0) | $(tput sgr 0 1)"$io_filesize"B$(tput sgr0) File";
echo "==== Write ====" >> $output_filename.txt;
dd if=/dev/zero of=tempfile bs=1M count=$io_filesize conv=fdatasync,notrunc &>> $output_filename.txt;
echo "3" | sudo tee /proc/sys/vm/drop_caches >> /dev/null;
echo "
==== Read ====" >> $output_filename.txt;
dd if=tempfile of=/dev/null bs=1M count=$io_filesize &>> $output_filename.txt;

rm tempfile
echo "


================================================================================

+--------------------+
| INTERNET BENCHMARK |
+--------------------+


" >> $output_filename.txt;
#INTERNET SPEED BENCHMARK
echo "
$(tput bold)[ $(date "+%H:%M:%S") ] $(tput setaf 2)$(tput bold)Starting Internet Benchmark ...$(tput sgr0)";
speedtest-cli | egrep "Download:|Upload:" >> $output_filename.txt;
echo "" >> $output_filename.txt

#DONE
echo "
             $(tput setaf 2)$(tput bold)+====================+
$(tput sgr0)$(tput bold)[ $(date "+%H:%M:%S") ]$(tput setaf 2) | $(tput sgr 0 1)$(tput setaf 3)FINISHED Benchmark$(tput sgr0)$(tput setaf 2) |
             +====================+$(tput sgr0)
";
