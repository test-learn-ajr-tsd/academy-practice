require 'socket'
require_relative 'cash_router.rb'

сервер = TCPServer.open('127.0.0.1', 3000)

while подключение = сервер.accept
	запрос = подключение.gets	
	метод, полныйПутьЗапроса, протокол = запрос.split(' ')
	путь, параметры = полныйПутьЗапроса.split('?')
	параметры = параметры.split('&').map { |пара| пара.split('=') }.to_h unless параметры.nil?
	puts параметры.to_s
	ответ = маршрутизацияДляCashMachine(путь, параметры)
	статус = ответ == '404' ? '404' : '200'

	подключение.print 'HTTP/1.1 ' + статус + " \r\n"
	подключение.print 'Content-Type: text/html' + "\r\n"
	подключение.print "\r\n"
	подключение.print ответ
	подключение.close
end