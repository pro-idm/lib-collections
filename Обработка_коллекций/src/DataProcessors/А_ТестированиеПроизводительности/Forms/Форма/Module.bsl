&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Объект.ТипКоллекции = "Массив";
	Объект.КоличествоВКоллекции = 10000;
	Объект.КоличествоПрогонов = 5;
КонецПроцедуры

&НаКлиенте
Процедура КомандаТиповойФильтр(Команда)
	ВыполнитьОперациюСЗамером(Объект.КоличествоВКоллекции, Объект.КоличествоПрогонов, Объект.ТипКоллекции, "Фильтр")
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ВыполнитьОперациюСЗамером(Знач КоличествоВКоллекции, Знач КоличествоПрогонов, Знач ТипКоллекции, Знач Операция)
	Коллекция = ПолучитьКоллекцию(ТипКоллекции, КоличествоВКоллекции);
	
	ВсегоВремяВыполненияТиповой = 0;
	ВсегоВремяВыполненияЛямбда = 0;
	Для Прогон = 1 По КоличествоПрогонов Цикл
		Если Операция = "Фильтр" Тогда
			Если ТипКоллекции = "Массив" Тогда
				НачалоЗамераТиповой = ТекущаяУниверсальнаяДатаВМиллисекундах();
				
				ТиповойФильтрМассив(Коллекция);
				
				ВремяВыполненияТиповой = ТекущаяУниверсальнаяДатаВМиллисекундах() - НачалоЗамераТиповой;
				ВсегоВремяВыполненияТиповой = ВсегоВремяВыполненияТиповой + ВремяВыполненияТиповой;
				
				НачалоЗамераЛямбда = ТекущаяУниверсальнаяДатаВМиллисекундах();
				
				ЛямбдаФильтрМассив(Коллекция);
				
				ВремяВыполненияЛямбда = ТекущаяУниверсальнаяДатаВМиллисекундах() - НачалоЗамераЛямбда;
				ВсегоВремяВыполненияЛямбда = ВсегоВремяВыполненияЛямбда + ВремяВыполненияЛямбда;
			ИначеЕсли ТипКоллекции = "ТаблицаЗначений" Тогда
				НачалоЗамераТиповой = ТекущаяУниверсальнаяДатаВМиллисекундах();
				
				ТиповойФильтрТаблицаЗначений(Коллекция);
				
				ВремяВыполненияТиповой = ТекущаяУниверсальнаяДатаВМиллисекундах() - НачалоЗамераТиповой;
				ВсегоВремяВыполненияТиповой = ВсегоВремяВыполненияТиповой + ВремяВыполненияТиповой;
				
				НачалоЗамераЛямбда = ТекущаяУниверсальнаяДатаВМиллисекундах();
				
				ЛямбдаФильтрТаблицаСписокЗначений(Коллекция);
				
				ВремяВыполненияЛямбда = ТекущаяУниверсальнаяДатаВМиллисекундах() - НачалоЗамераЛямбда;
				ВсегоВремяВыполненияЛямбда = ВсегоВремяВыполненияЛямбда + ВремяВыполненияЛямбда;
			ИначеЕсли ТипКоллекции = "СписокЗначений" Тогда
				НачалоЗамераТиповой = ТекущаяУниверсальнаяДатаВМиллисекундах();
				
				ТиповойФильтрСписокЗначений(Коллекция);
				
				ВремяВыполненияТиповой = ТекущаяУниверсальнаяДатаВМиллисекундах() - НачалоЗамераТиповой;
				ВсегоВремяВыполненияТиповой = ВсегоВремяВыполненияТиповой + ВремяВыполненияТиповой;
				
				НачалоЗамераЛямбда = ТекущаяУниверсальнаяДатаВМиллисекундах();
				
				ЛямбдаФильтрТаблицаСписокЗначений(Коллекция);
				
				ВремяВыполненияЛямбда = ТекущаяУниверсальнаяДатаВМиллисекундах() - НачалоЗамераЛямбда;
				ВсегоВремяВыполненияЛямбда = ВсегоВремяВыполненияЛямбда + ВремяВыполненияЛямбда;
			КонецЕсли; 			
		Иначе
			ВызватьИсключение "Неизвестная операция!";
		КонецЕсли;
	КонецЦикла;
	
	Сообщить("Среднее время выполнения типовой (мс): " + ВсегоВремяВыполненияТиповой / КоличествоПрогонов);
	Сообщить("Среднее время выполнения лямбда (мс): " + ВсегоВремяВыполненияЛямбда / КоличествоПрогонов);
	Сообщить("Средняя дельта времени выполнения типовой и лямбда (мс): " + (ВсегоВремяВыполненияЛямбда - ВсегоВремяВыполненияТиповой) / КоличествоПрогонов);
	Если ВсегоВремяВыполненияТиповой > 0 Тогда
		Сообщить("% увеличения времени выполнения: " + Окр(ВсегоВремяВыполненияЛямбда / ВсегоВремяВыполненияТиповой * 100 - 100, 2));
	КонецЕсли;	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ТиповойФильтрМассив(Коллекция)
	Делитель = 10;
	
	Результат = Новый Массив;
	Для Каждого Элемент Из Коллекция Цикл
		Если Элемент % Делитель = 0 Тогда
			Результат.Добавить(Элемент);
		КонецЕсли;
	КонецЦикла;
	
	Возврат Результат;
КонецФункции

&НаСервереБезКонтекста
Функция ТиповойФильтрТаблицаЗначений(Коллекция)
	Делитель = 10;
	
	Результат = Коллекция.СкопироватьКолонки();
	Для Каждого Элемент Из Коллекция Цикл
		Если Элемент.Значение % Делитель = 0 Тогда
			ЭлементРезультат = Результат.Добавить();
			ЗаполнитьЗначенияСвойств(ЭлементРезультат, Элемент);
		КонецЕсли;
	КонецЦикла;
	
	Возврат Результат;
КонецФункции

&НаСервереБезКонтекста
Функция ТиповойФильтрСписокЗначений(Коллекция)
	Делитель = 10;
	
	Результат = Новый СписокЗначений;
	Для Каждого Элемент Из Коллекция Цикл
		Если Элемент.Значение % Делитель = 0 Тогда
			ЭлементРезультат = Результат.Добавить();
			ЗаполнитьЗначенияСвойств(ЭлементРезультат, Элемент);
		КонецЕсли;
	КонецЦикла;
	
	Возврат Результат;
КонецФункции

&НаСервереБезКонтекста
Функция ЛямбдаФильтрМассив(Коллекция)
	Возврат А_Коллекции.Фильтр(Коллекция, "Элемент % Делитель = 0", Новый Структура("Делитель", 10));
КонецФункции

&НаСервереБезКонтекста
Функция ЛямбдаФильтрТаблицаСписокЗначений(Коллекция)
	Возврат А_Коллекции.Фильтр(Коллекция, "Элемент.Значение % Делитель = 0", Новый Структура("Делитель", 10));
КонецФункции

&НаСервереБезКонтекста
Функция ПолучитьКоллекцию(Знач ТипКоллекции, Знач Количество)
	Если ТипКоллекции = "Массив" Тогда
		Коллекция = Новый Массив;
		
		Для Счетчик = 1 По Количество Цикл
			Коллекция.Добавить(Счетчик);
		КонецЦикла;
	ИначеЕсли ТипКоллекции = "ТаблицаЗначений" Тогда
		Коллекция = Новый ТаблицаЗначений;
		Коллекция.Колонки.Добавить("Значение");
		
		Для Счетчик = 1 По Количество Цикл
			Коллекция.Добавить().Значение = Счетчик;
		КонецЦикла;
	ИначеЕсли ТипКоллекции = "СписокЗначений" Тогда
		Коллекция = Новый СписокЗначений;
		
		Для Счетчик = 1 По Количество Цикл
			Коллекция.Добавить(Счетчик);
		КонецЦикла;
	Иначе
		ВызватьИсключение "Не поддерживаемая коллекция";
	КонецЕсли;
	
	Возврат Коллекция;
КонецФункции