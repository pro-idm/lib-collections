#Область ИнициализацияЯдра

Перем КонтекстЯдра;
Перем Утверждения;

Перем МодульКоллекции;

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
	
	МодульКоллекции = Вычислить("А_Коллекции");
КонецПроцедуры

#КонецОбласти

Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
	
	НаборТестов.НачатьГруппу("ДляКаждого");
	
	НаборТестов.Добавить("ДляКаждого_Параметр_НеКоллекция");
	НаборТестов.Добавить("ДляКаждого_Параметр_ВыражениеНеСтрока");
	НаборТестов.Добавить("ДляКаждого_Параметр_КонтекстНеСтруктура");
	
	НаборТестов.Добавить("ДляКаждого_Массив");
	НаборТестов.Добавить("ДляКаждого_СписокЗначений");
	НаборТестов.Добавить("ДляКаждого_ТаблицаЗначений");
	
	НаборТестов.НачатьГруппу("Фильтр");
	
	НаборТестов.Добавить("Фильтр_Параметр_НеКоллекция");
	НаборТестов.Добавить("Фильтр_Параметр_ВыражениеНеСтрока");
	НаборТестов.Добавить("Фильтр_Параметр_КонтекстНеСтруктура");
	
	НаборТестов.Добавить("Фильтр_Пустой_Массив");
	НаборТестов.Добавить("Фильтр_Пустой_СписокЗначений");
	НаборТестов.Добавить("Фильтр_Пустая_ТаблицаЗначений");
	
	НаборТестов.Добавить("Фильтр_ПустоеВыражение_Массив");
	НаборТестов.Добавить("Фильтр_ПустоеВыражение_СписокЗначений");
	НаборТестов.Добавить("Фильтр_ПустоеВыражение_ТаблицаЗначений");
	
	НаборТестов.Добавить("Фильтр_Массив");
	НаборТестов.Добавить("Фильтр_СписокЗначений");
	НаборТестов.Добавить("Фильтр_ТаблицаЗначений");
	
	НаборТестов.НачатьГруппу("ПреобразоватьВМассив");
	
	НаборТестов.Добавить("ПреобразоватьВМассив_Параметр_НеКоллекция");
	НаборТестов.Добавить("ПреобразоватьВМассив_Параметр_ВыражениеНеСтрока");
	НаборТестов.Добавить("ПреобразоватьВМассив_Параметр_КонтекстНеСтруктура");
	
	НаборТестов.Добавить("ПреобразоватьВМассив_Пустой_Массив");
	НаборТестов.Добавить("ПреобразоватьВМассив_Пустой_СписокЗначений");
	НаборТестов.Добавить("ПреобразоватьВМассив_Пустая_ТаблицаЗначений");
	
	НаборТестов.Добавить("ПреобразоватьВМассив_ПустоеВыражение_Массив");
	НаборТестов.Добавить("ПреобразоватьВМассив_ПустоеВыражение_СписокЗначений");
	НаборТестов.Добавить("ПреобразоватьВМассив_ПустоеВыражение_ТаблицаЗначений");
	
	НаборТестов.Добавить("ПреобразоватьВМассив_Массив");
	НаборТестов.Добавить("ПреобразоватьВМассив_СписокЗначений");
	НаборТестов.Добавить("ПреобразоватьВМассив_ТаблицаЗначений");
КонецПроцедуры

#Область Тесты

#Область Тесты_ДляКаждого

Процедура ДляКаждого_Параметр_НеКоллекция() Экспорт
	ТекстИсключения = "";
	
	Коллекция = "Это не коллекция!";
	Выражение = "";
	Попытка
		МодульКоллекции.ДляКаждого(Коллекция, Выражение);
	Исключение
		ТекстИсключения = ИнформацияОбОшибке().Описание;
	КонецПопытки;
	
	Утверждения.ПроверитьРавенство(ТекстИсключения, "Обязательный параметр <Коллекция> не является коллекцией");
КонецПроцедуры

Процедура ДляКаждого_Параметр_ВыражениеНеСтрока() Экспорт
	ТекстИсключения = "";
	
	Коллекция = Новый Массив;
	Выражение = 0;
	Попытка
		МодульКоллекции.ДляКаждого(Коллекция, Выражение);
	Исключение
		ТекстИсключения = ИнформацияОбОшибке().Описание;
	КонецПопытки;
	
	Утверждения.ПроверитьРавенство(ТекстИсключения, "Обязательный параметр <Выражение> не является строкой");
КонецПроцедуры

Процедура ДляКаждого_Параметр_КонтекстНеСтруктура() Экспорт
	ТекстИсключения = "";
	
	Коллекция = Новый Массив;
	Выражение = "Элемент > 0";
	Контекст = "";
	Попытка
		МодульКоллекции.ДляКаждого(Коллекция, Выражение, Контекст);
	Исключение
		ТекстИсключения = ИнформацияОбОшибке().Описание;
	КонецПопытки;
	
	Утверждения.ПроверитьРавенство(ТекстИсключения, "Необязательный параметр <Контекст> указан и не является структурой");
КонецПроцедуры

Процедура ДляКаждого_Массив() Экспорт
	Коллекция = СоздатьМассивИзЗначений(1, 2, 3, 4, 5);
	Выражение = "Если Элемент > А Тогда
				|	Тест.Добавить(Элемент + Индекс);
				|КонецЕсли;";
	Контекст = Новый Структура("Тест, А", Новый Массив, 3);
	
	МодульКоллекции.ДляКаждого(Коллекция, Выражение, Контекст);
	КоллекцияШаблон = СоздатьМассивИзЗначений(7, 9);
	КоллекцияРезультат = Контекст.Тест;
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура ДляКаждого_СписокЗначений() Экспорт
	Коллекция = СоздатьСписокЗначений(СоздатьМассивИзЗначений(1, 2, 3, 4, 5));
	Выражение = "Элемент.Значение = Элемент.Значение + А; 
				|Элемент.Представление = СтрШаблон(""Индекс %1"", Индекс);";
	Контекст = Новый Структура("А", 10);
	
	МодульКоллекции.ДляКаждого(Коллекция, Выражение, Контекст);
	КоллекцияРезультат = Коллекция;
	КоллекцияШаблон = СоздатьСписокЗначений(
		СоздатьМассивИзЗначений(11, 12, 13, 14, 15),
		СоздатьМассивИзЗначений("Индекс 0", "Индекс 1", "Индекс 2", "Индекс 3", "Индекс 4")
	);
	
	ПроверитьРавенствоСписковЗначений(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура ДляКаждого_ТаблицаЗначений() Экспорт
	Коллекция = ТаблицаЗначенийДляТеста(1, 10);
	Выражение = "Элемент.ЗначениеСтрока = Буква;
				|Элемент.ЗначениеЧисло = Индекс;
				|Элемент.ЗначениеБезТипа = '20210101';";
	Контекст = Новый Структура("Буква", "А");
	
	МодульКоллекции.ДляКаждого(Коллекция, Выражение, Контекст);
	
	Для Индекс = 0 По 9 Цикл
		Элемент = Коллекция[Индекс];
		
		ТекстОшибка = "Ошибка в строке по индексу " + Индекс;
		Утверждения.ПроверитьРавенство(Индекс, Элемент.ЗначениеЧисло, ТекстОшибка);
		Утверждения.ПроверитьРавенство("А", Элемент.ЗначениеСтрока, ТекстОшибка);
		Утверждения.ПроверитьРавенство('20210101', Элемент.ЗначениеБезТипа, ТекстОшибка);
	КонецЦикла;
КонецПроцедуры

#КонецОбласти

#Область Тесты_Фильтр

Процедура Фильтр_Параметр_НеКоллекция() Экспорт
	ТекстИсключения = "";
	
	Коллекция = "Это не коллекция!";
	Выражение = "";
	Попытка
		МодульКоллекции.Фильтр(Коллекция, Выражение);
	Исключение
		ТекстИсключения = ИнформацияОбОшибке().Описание;
	КонецПопытки;
	
	Утверждения.ПроверитьРавенство(ТекстИсключения, "Обязательный параметр <Коллекция> не является коллекцией");
КонецПроцедуры

Процедура Фильтр_Параметр_ВыражениеНеСтрока() Экспорт
	ТекстИсключения = "";
	
	Коллекция = Новый Массив;
	Выражение = 0;
	Попытка
		МодульКоллекции.Фильтр(Коллекция, Выражение);
	Исключение
		ТекстИсключения = ИнформацияОбОшибке().Описание;
	КонецПопытки;
	
	Утверждения.ПроверитьРавенство(ТекстИсключения, "Обязательный параметр <Выражение> не является строкой");
КонецПроцедуры

Процедура Фильтр_Параметр_КонтекстНеСтруктура() Экспорт
	ТекстИсключения = "";
	
	Коллекция = Новый Массив;
	Выражение = "Элемент > 0";
	Контекст = "";
	Попытка
		МодульКоллекции.Фильтр(Коллекция, Выражение, Контекст);
	Исключение
		ТекстИсключения = ИнформацияОбОшибке().Описание;
	КонецПопытки;
	
	Утверждения.ПроверитьРавенство(ТекстИсключения, "Необязательный параметр <Контекст> указан и не является структурой");
КонецПроцедуры

Процедура Фильтр_Пустой_Массив() Экспорт
	Коллекция = Новый Массив;
	Выражение = "Элемент > 0";
	
	КоллекцияРезультат = МодульКоллекции.Фильтр(Коллекция, Выражение);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(Коллекция, КоллекцияРезультат);
	Утверждения.ПроверитьНеРавенство(Коллекция, КоллекцияРезультат);
КонецПроцедуры

Процедура Фильтр_Пустая_ТаблицаЗначений() Экспорт
	Коллекция = Новый ТаблицаЗначений();
	Коллекция.Колонки.Добавить("Значение");
	Выражение = "Элемент.Значение > 0";
	
	КоллекцияРезультат = МодульКоллекции.Фильтр(Коллекция, Выражение);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "ТаблицаЗначений");
	ПроверитьРавенствоТаблицЗначений(Коллекция, КоллекцияРезультат);
	Утверждения.ПроверитьНеРавенство(Коллекция, КоллекцияРезультат);
КонецПроцедуры

Процедура Фильтр_Пустой_СписокЗначений() Экспорт	
	Коллекция = Новый СписокЗначений();
	Выражение = "Элемент.Значение > 0";
	
	КоллекцияРезультат = МодульКоллекции.Фильтр(Коллекция, Выражение);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "СписокЗначений");
	ПроверитьРавенствоСписковЗначений(Коллекция, КоллекцияРезультат);
	Утверждения.ПроверитьНеРавенство(Коллекция, КоллекцияРезультат);
КонецПроцедуры

Процедура Фильтр_ПустоеВыражение_Массив() Экспорт
	Коллекция = СоздатьМассивИзЗначений(1, 2, 3, 4, 5);
	Выражение = "";
	
	КоллекцияРезультат = МодульКоллекции.Фильтр(Коллекция, Выражение);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(Коллекция, КоллекцияРезультат);
	Утверждения.ПроверитьНеРавенство(Коллекция, КоллекцияРезультат);
КонецПроцедуры

Процедура Фильтр_ПустоеВыражение_ТаблицаЗначений() Экспорт
	Коллекция = ТаблицаЗначенийДляТеста(1, 10);
	Выражение = "";
	
	КоллекцияРезультат = МодульКоллекции.Фильтр(Коллекция, Выражение);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "ТаблицаЗначений");
	ПроверитьРавенствоТаблицЗначений(Коллекция, КоллекцияРезультат);
	Утверждения.ПроверитьНеРавенство(Коллекция, КоллекцияРезультат);
КонецПроцедуры

Процедура Фильтр_ПустоеВыражение_СписокЗначений() Экспорт
	Коллекция = СоздатьСписокЗначений(СоздатьМассивИзЗначений(1, 2, 3, 4, 5));
	Выражение = "";
	
	КоллекцияРезультат = МодульКоллекции.Фильтр(Коллекция, Выражение);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "СписокЗначений");
	ПроверитьРавенствоСписковЗначений(Коллекция, КоллекцияРезультат);
	Утверждения.ПроверитьНеРавенство(Коллекция, КоллекцияРезультат);
КонецПроцедуры

Процедура Фильтр_Массив() Экспорт
	Коллекция = СоздатьМассивИзЗначений(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
	Выражение = "ЭтоЧетное = (Индекс + 1) % 2 = 0;
				|Элемент > А И Не ЭтоЧетное";
	Контекст = Новый Структура("А", 2);
	
	КоллекцияРезультат = МодульКоллекции.Фильтр(Коллекция, Выражение, Контекст);
	КоллекцияШаблон = СоздатьМассивИзЗначений(3, 5, 7, 9);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
	Утверждения.ПроверитьНеРавенство(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура Фильтр_ТаблицаЗначений() Экспорт
	Коллекция = ТаблицаЗначенийДляТеста(1, 10);
	Выражение = "БукваВСлове = СтрНайти(Слово, Элемент.ЗначениеСтрока);
				|Индекс = 1 И БукваВСлове";
	Контекст = Новый Структура("Слово", "БУКВА");
	
	КоллекцияРезультат = МодульКоллекции.Фильтр(Коллекция, Выражение, Контекст);
	КоллекцияШаблон = ТаблицаЗначенийДляТеста(2, 2);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "ТаблицаЗначений");
	ПроверитьРавенствоТаблицЗначений(КоллекцияШаблон, КоллекцияРезультат);
	Утверждения.ПроверитьНеРавенство(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура Фильтр_СписокЗначений() Экспорт
	Коллекция = СоздатьСписокЗначений(
		СоздатьМассивИзЗначений(1, 2, 3, 4, 5),
		СоздатьМассивИзЗначений("А", "Б", "В", "Г", "Д")
	);
	Выражение = "БукваВСлове = СтрНайти(Слово, Элемент.Представление);
				|Индекс > А И БукваВСлове";
	Контекст = Новый Структура("А, Слово", 2, "ДОРОГА");
	
	КоллекцияРезультат = МодульКоллекции.Фильтр(Коллекция, Выражение, Контекст);
	КоллекцияШаблон = СоздатьСписокЗначений(
		СоздатьМассивИзЗначений(4, 5),
		СоздатьМассивИзЗначений("Г", "Д")
	);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "СписокЗначений");
	ПроверитьРавенствоСписковЗначений(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

#КонецОбласти

#Область Тесты_ПреобразоватьВМассив

Процедура ПреобразоватьВМассив_Параметр_НеКоллекция() Экспорт
	ТекстИсключения = "";
	
	Коллекция = "Это не коллекция!";
	Выражение = "";
	Попытка
		МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	Исключение
		ТекстИсключения = ИнформацияОбОшибке().Описание;
	КонецПопытки;
	
	Утверждения.ПроверитьРавенство(ТекстИсключения, "Обязательный параметр <Коллекция> не является коллекцией");
КонецПроцедуры

Процедура ПреобразоватьВМассив_Параметр_ВыражениеНеСтрока() Экспорт
	ТекстИсключения = "";
	
	Коллекция = Новый Массив;
	Выражение = 0;
	Попытка
		МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	Исключение
		ТекстИсключения = ИнформацияОбОшибке().Описание;
	КонецПопытки;
	
	Утверждения.ПроверитьРавенство(ТекстИсключения, "Обязательный параметр <Выражение> не является строкой");
КонецПроцедуры

Процедура ПреобразоватьВМассив_Параметр_КонтекстНеСтруктура() Экспорт
	ТекстИсключения = "";
	
	Коллекция = Новый Массив;
	Выражение = "Элемент > 0";
	Контекст = "";
	Попытка
		МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение, Контекст);
	Исключение
		ТекстИсключения = ИнформацияОбОшибке().Описание;
	КонецПопытки;
	
	Утверждения.ПроверитьРавенство(ТекстИсключения, "Необязательный параметр <Контекст> указан и не является структурой");
КонецПроцедуры

Процедура ПреобразоватьВМассив_Пустой_Массив() Экспорт
	Коллекция = Новый Массив;
	Выражение = "Элемент + Индекс";
	
	КоллекцияРезультат = МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	КоллекцияШаблон = Новый Массив;
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура ПреобразоватьВМассив_Пустая_ТаблицаЗначений() Экспорт
	Коллекция = Новый ТаблицаЗначений();
	Коллекция.Колонки.Добавить("Значение");
	Выражение = "Элемент.Значение + Индекс";
	
	КоллекцияРезультат = МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	КоллекцияШаблон = Новый Массив;
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура ПреобразоватьВМассив_Пустой_СписокЗначений() Экспорт	
	Коллекция = Новый СписокЗначений();
	Выражение = "Элемент.Значение + Индекс";
	
	КоллекцияРезультат = МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	КоллекцияШаблон = Новый Массив;
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура ПреобразоватьВМассив_ПустоеВыражение_Массив() Экспорт
	Коллекция = СоздатьМассивИзЗначений(1, 2, 3, 4, 5);
	Выражение = "";
	
	КоллекцияРезультат = МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	КоллекцияШаблон = СоздатьМассивПовторивЗначение(5, Неопределено);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура ПреобразоватьВМассив_ПустоеВыражение_ТаблицаЗначений() Экспорт
	Коллекция = ТаблицаЗначенийДляТеста(1, 5);
	Выражение = "";
	
	КоллекцияРезультат = МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	КоллекцияШаблон = СоздатьМассивПовторивЗначение(5, Неопределено);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура ПреобразоватьВМассив_ПустоеВыражение_СписокЗначений() Экспорт
	Коллекция = СоздатьСписокЗначений(СоздатьМассивИзЗначений(1, 2, 3, 4, 5));
	Выражение = "";
	
	КоллекцияРезультат = МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	КоллекцияШаблон = СоздатьМассивПовторивЗначение(5, Неопределено);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура ПреобразоватьВМассив_Массив() Экспорт
	Коллекция = СоздатьМассивИзЗначений(1, 2, 3, 4, 5);
	Выражение = "Элемент + Индекс";
	
	КоллекцияРезультат = МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	КоллекцияШаблон = СоздатьМассивИзЗначений(1, 3, 5, 7, 9);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура ПреобразоватьВМассив_ТаблицаЗначений() Экспорт
	Коллекция = ТаблицаЗначенийДляТеста(1, 5);
	Выражение = "Элемент.ЗначениеЧисло + Индекс";
	
	КоллекцияРезультат = МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	КоллекцияШаблон = СоздатьМассивИзЗначений(1, 3, 5, 7, 9);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

Процедура ПреобразоватьВМассив_СписокЗначений() Экспорт	
	Коллекция = СоздатьСписокЗначений(СоздатьМассивИзЗначений(1, 2, 3, 4, 5));
	Выражение = "Элемент.Значение + Индекс";
	
	КоллекцияРезультат = МодульКоллекции.ПреобразоватьВМассив(Коллекция, Выражение);
	КоллекцияШаблон = СоздатьМассивИзЗначений(1, 3, 5, 7, 9);
	
	Утверждения.ПроверитьТип(КоллекцияРезультат, "Массив");
	ПроверитьРавенствоМассивов(КоллекцияШаблон, КоллекцияРезультат);
КонецПроцедуры

#КонецОбласти

#КонецОбласти //Тесты

#Область ВспомогательныеФункции

Функция СоздатьМассивПовторивЗначение(Количество, Значение)
	Результат = Новый Массив;
	
	Для Счетчик = 1 По Количество Цикл
		Результат.Добавить(Значение);
	КонецЦикла;
	
	Возврат Результат;
КонецФункции

Функция СоздатьМассивИзЗначений(Элемент1 = Неопределено, Элемент2 = Неопределено, Элемент3 = Неопределено,
					Элемент4 = Неопределено, Элемент5 = Неопределено, Элемент6 = Неопределено, Элемент7 = Неопределено,
					Элемент8 = Неопределено, Элемент9 = Неопределено, Элемент10 = Неопределено)
	
	Результат = Новый Массив;
	
	Если Элемент1 <> Неопределено Тогда
		Результат.Добавить(Элемент1);
		Если Элемент2 <> Неопределено Тогда
			Результат.Добавить(Элемент2);
			Если Элемент3 <> Неопределено Тогда
				Результат.Добавить(Элемент3);
				Если Элемент4 <> Неопределено Тогда
					Результат.Добавить(Элемент4);
					Если Элемент5 <> Неопределено Тогда
						Результат.Добавить(Элемент5);
						Если Элемент6 <> Неопределено Тогда
							Результат.Добавить(Элемент6);
							Если Элемент7 <> Неопределено Тогда
								Результат.Добавить(Элемент7);
								Если Элемент8 <> Неопределено Тогда
									Результат.Добавить(Элемент8);
									Если Элемент9 <> Неопределено Тогда
										Результат.Добавить(Элемент9);
										Если Элемент10 <> Неопределено Тогда
											Результат.Добавить(Элемент10);
										КонецЕсли;
									КонецЕсли;
								КонецЕсли;
							КонецЕсли;
						КонецЕсли;
					КонецЕсли;
				КонецЕсли;
			КонецЕсли;
		КонецЕсли;
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

Функция СоздатьСписокЗначений(Значения = Неопределено, Представления = Неопределено, ТипЗначения = Неопределено)
	Результат = Новый СписокЗначений;
	
	Если ТипЗначения <> Неопределено Тогда
		Результат.ТипЗначения = ТипЗначения;
	КонецЕсли;
	Если Значения <> Неопределено Тогда
		Результат.ЗагрузитьЗначения(Значения);
		
		Если Представления <> Неопределено Тогда
			Для Индекс = 0 По Представления.ВГраница() Цикл
				Результат[Индекс].Представление = Представления[Индекс];
			КонецЦикла;
		КонецЕсли;
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

Функция ТаблицаЗначенийДляТеста(От, До)
	ОписаниеЧисло = Новый ОписаниеТипов("Число", Новый КвалификаторыЧисла(6));
	ОписаниеСтрока = Новый ОписаниеТипов("Строка", , Новый КвалификаторыСтроки(25)); 
	
	Результат = Новый ТаблицаЗначений();
	Результат.Колонки.Добавить("ЗначениеЧисло", ОписаниеЧисло, "Заголовок", 10);
	Результат.Колонки.Добавить("ЗначениеСтрока", ОписаниеСтрока);
	Результат.Колонки.Добавить("ЗначениеБезТипа");
	
	Буквы = "АБВГДЕЖЗИКЛМН";
	Для Индекс = От По До Цикл
		СтрокаРезультат = Результат.Добавить();
		СтрокаРезультат.ЗначениеЧисло = Индекс;
		СтрокаРезультат.ЗначениеСтрока = Сред(Буквы, Индекс, 1);
		
		Если Индекс % 2 Тогда
			СтрокаРезультат.ЗначениеБезТипа = Неопределено;
		Иначе
			СтрокаРезультат.ЗначениеБезТипа = Индекс * 2;		
		КонецЕсли;		
	КонецЦикла;
	
	Возврат Результат;
КонецФункции

Процедура ЗаполнитьТаблицуЗначений(Таблица, ЗначенияКолонки1 = Неопределено, ЗначенияКолонки2 = Неопределено, ЗначенияКолонки3 = Неопределено)
	Если ЗначенияКолонки1 <> Неопределено Тогда
		Колонка1 = Таблица.Колонки[0];
	КонецЕсли;
	Если ЗначенияКолонки2 <> Неопределено Тогда
		Колонка2 = Таблица.Колонки[1];
	КонецЕсли;
	Если ЗначенияКолонки3 <> Неопределено Тогда
		Колонка3 = Таблица.Колонки[2];
	КонецЕсли;
	
	Если ЗначенияКолонки1 <> Неопределено Или ЗначенияКолонки2 <> Неопределено Или ЗначенияКолонки3 <> Неопределено Тогда
		Для Индекс = 0 По Таблица.Количество() - 1 Цикл
			СтрокаТаблица = Таблица[Индекс];
			
			Если ЗначенияКолонки1 <> Неопределено Тогда
				СтрокаТаблица[Колонка1] = ЗначенияКолонки1[Индекс];
			КонецЕсли;
			Если ЗначенияКолонки2 <> Неопределено Тогда
				СтрокаТаблица[Колонка2] = ЗначенияКолонки2[Индекс];
			КонецЕсли;
			Если ЗначенияКолонки3 <> Неопределено Тогда
				СтрокаТаблица[Колонка3] = ЗначенияКолонки3[Индекс];
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
КонецПроцедуры

Процедура ПроверитьРавенствоМассивов(МассивШаблон, МассивПроверяемый)
	Утверждения.ПроверитьРавенство(МассивШаблон.Количество(), МассивПроверяемый.Количество(), "Количество элементов отличается");
	Для Индекс = 0 По МассивШаблон.ВГраница() Цикл
		ЭлементШаблон = МассивШаблон[Индекс];
		ЭлементПроверяемый = МассивПроверяемый[Индекс];
		
		Утверждения.ПроверитьРавенство(ЭлементШаблон, ЭлементПроверяемый, "Отличается элемент #" + Индекс);
	КонецЦикла; 
КонецПроцедуры

Процедура ПроверитьРавенствоТаблицЗначений(ТаблицаШаблон, ТаблицаПроверяемая)
	Утверждения.ПроверитьРавенство(ТаблицаШаблон.Колонки.Количество(), ТаблицаПроверяемая.Колонки.Количество(), "Количество колонок отличается");
	Утверждения.ПроверитьРавенство(ТаблицаШаблон.Количество(), ТаблицаПроверяемая.Количество(), "Количество элементов отличается");
	
	ВГраницаКолонок = ТаблицаШаблон.Колонки.Количество() - 1;
	Для ИндексКолонки = 0 По ВГраницаКолонок Цикл
		КолонкаШаблон = ТаблицаШаблон.Колонки[ИндексКолонки];
		КолонкаПроверяемая = ТаблицаПроверяемая.Колонки[ИндексКолонки];
		
		Утверждения.ПроверитьРавенство(КолонкаШаблон.Имя, КолонкаПроверяемая.Имя, "Отличается имя колонки " + КолонкаШаблон.Имя);
		Утверждения.ПроверитьРавенство(КолонкаШаблон.Заголовок, КолонкаПроверяемая.Заголовок, "Отличается заголовок колонки " + КолонкаШаблон.Имя);
		Утверждения.ПроверитьРавенство(КолонкаШаблон.Ширина, КолонкаПроверяемая.Ширина, "Отличается ширина колонки " + КолонкаШаблон.Имя);
		Утверждения.ПроверитьРавенство(КолонкаШаблон.ТипЗначения, КолонкаПроверяемая.ТипЗначения, "Отличается тип колонки " + КолонкаШаблон.Имя);		
	КонецЦикла;
	
	ВГраница = ТаблицаШаблон.Количество() - 1;
	Для Индекс = 0 По ВГраница Цикл
		СтрокаШаблон = ТаблицаШаблон[Индекс];
		СтрокаПроверяемая = ТаблицаПроверяемая[Индекс];
		
		Для Каждого Колонка Из ТаблицаШаблон.Колонки Цикл
			Утверждения.ПроверитьРавенство(СтрокаШаблон[Колонка.Имя], СтрокаПроверяемая[Колонка.Имя], "Отличается элемент #" + Индекс + " по колонке " + Колонка.Имя);			
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

Процедура ПроверитьРавенствоСписковЗначений(СписокШаблон, СписокПроверяемый)
	Утверждения.ПроверитьРавенство(СписокШаблон.Количество(), СписокПроверяемый.Количество(), "Количество элементов отличается");
	Утверждения.ПроверитьРавенство(СписокШаблон.ТипЗначения, СписокПроверяемый.ТипЗначения, "Тип значения списка отличается");
	
	ВГраница = СписокШаблон.Количество() - 1;
	Для Индекс = 0 По ВГраница Цикл
		ЭлементШаблон = СписокШаблон[Индекс];
		ЭлементПроверяемый = СписокПроверяемый[Индекс];
		
		Утверждения.ПроверитьРавенство(ЭлементШаблон.Значение, ЭлементПроверяемый.Значение, "Отличается значение элемента #" + Индекс);
		Утверждения.ПроверитьРавенство(ЭлементШаблон.Представление, ЭлементПроверяемый.Представление, "Отличается представление элемента #" + Индекс);
		Утверждения.ПроверитьРавенство(ЭлементШаблон.Пометка, ЭлементПроверяемый.Пометка, "Отличается пометка элемента #" + Индекс);
		Утверждения.ПроверитьРавенство(ЭлементШаблон.Картинка, ЭлементПроверяемый.Картинка, "Отличается картинка элемента #" + Индекс);
	КонецЦикла; 
КонецПроцедуры

#КонецОбласти