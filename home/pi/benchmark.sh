#FOR THIS BENCHMARK TO WORK YOU NEED TO HAVE SYSBENCH, SPEEDTEST-CLI AND SCREEN INSTALLED
echo "Beginning Benchmark";
echo "CPU BENCHMARK


" >> output.txt;
#CPU BENCHMARKS
echo "Starting CPU benchmark.....| 1 Thread calculates primes to 10.000";
sysbench --test=cpu --num-threads=1 --cpu-max-prime=10000 run > output.txt;
echo "Starting CPU benchmark.....| 1 Thread calculates primes to 100.000";
sysbench --test=cpu --num-threads=1 --cpu-max-prime=100000 run >> output.txt;
echo "Starting CPU benchmark.....| 4 Threads calculates primes to 10.000";
sysbench --test=cpu --num-threads=4 --cpu-max-prime=10000 run >> output.txt;
echo "Starting CPU benchmark.....| 4 Threads calculates primes to 100.000";
sysbench --test=cpu --num-threads=4 --cpu-max-prime=100000 run >> output.txt;
echo "


IO BENCHMARK
" >> output.txt;
#IO READ/WRITE SPEEDS
echo "Starting IO Benchmark......| 1GB File";
sysbench --test=fileio --file-total-size=1G prepare > /dev/null;
sysbench --test=fileio --file-total-size=1G --file-test-mode=rndrw --init-rng=on --max-time=1200 --max-requests=0 run >> output.txt;
sysbench --test=fileio --file-total-size=1G cleanup > /dev/null;
echo "


Internet BENCHMARK
" >> output.txt;
#INTERNET SPEED BENCHMARK
echo "Starting Internet Benchmark ...";
speedtest-cli >> output.txt;

#DONE
echo "FINISHED Benchmark";

