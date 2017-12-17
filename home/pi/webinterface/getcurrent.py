import os;
tmp = "";
tmp2 = "";
while 1==1:
	tmp = tmp = os.popen("mpc current").read();
	if tmp != tmp2:
		tmp2 = tmp = os.popen("mpc current").read();
		file = open("/var/www/html/current.html","w");
		file.write("<!DOCTYPE html><html><head><meta charset='utf-8'><meta http-equiv='refresh' content='1'><title></title><link rel='stylesheet' href='main.css'></head><body class='current'><p class='current'>");
		file.write(str(tmp2));
		file.write("</p></body></html>")
		file.close();
