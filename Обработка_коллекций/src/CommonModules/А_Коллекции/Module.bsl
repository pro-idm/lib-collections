#Область ПубличныеМетоды

Функция Фильтр(Знач Коллекция, Знач Выражение, Знач Контекст = Неопределено) Экспорт
	ТипКоллекции = ТипЗнч(Коллекция);
	ПроверкаПараметров(ТипКоллекции, Выражение, Контекст);
	 
	Если Коллекция.Количество() = 0 Тогда
		Результат = ПустаяКоллекция(ТипКоллекции, Коллекция);
	ИначеЕсли ПустаяСтрока(Выражение) Тогда
		Результат = СкопироватьКоллекцию(ТипКоллекции, Коллекция);
	Иначе
		Шаблон = ШаблонФильтр(ТипКоллекции);
		Код = ПолучитьКодДляВыполнения(Шаблон, Выражение, Контекст, Истина);
		
		Параметры = Новый Структура("Коллекция, Контекст", Коллекция, Контекст);
		ВыполнитьКод(Код, Параметры);
		Результат = Параметры.Результат;
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

Процедура ДляКаждого(Знач Коллекция, Знач Выражение, Знач Контекст = Неопределено) Экспорт
	ТипКоллекции = ТипЗнч(Коллекция);
	ПроверкаПараметров(ТипКоллекции, Выражение, Контекст);
	 
	Если Коллекция.Количество() > 0 И Не ПустаяСтрока(Выражение) Тогда
		Шаблон = ШаблонДляКаждого();
		Код = ПолучитьКодДляВыполнения(Шаблон, Выражение, Контекст, Ложь);
		
		Параметры = Новый Структура("Коллекция, Контекст", Коллекция, Контекст);
		ВыполнитьКод(Код, Параметры);
	КонецЕсли;
КонецПроцедуры

Функция ПреобразоватьВМассив(Знач Коллекция, Знач Выражение, Знач Контекст = Неопределено) Экспорт
	ТипКоллекции = ТипЗнч(Коллекция);
	ПроверкаПараметров(ТипКоллекции, Выражение, Контекст);
	 
	Если Коллекция.Количество() = 0 Тогда
		Результат = Новый Массив;
	ИначеЕсли ПустаяСтрока(Выражение) Тогда
		Результат = Новый Массив;
		
		ВГраница = Коллекция.Количество() - 1; 
		Для Индекс = 0 По ВГраница Цикл
			Результат.Добавить(Неопределено);			
		КонецЦикла;
	Иначе
		Шаблон = ШаблонПреобразоватьВМассив();
		Код = ПолучитьКодДляВыполнения(Шаблон, Выражение, Контекст, Истина);
		
		Параметры = Новый Структура("Коллекция, Контекст", Коллекция, Контекст);
		ВыполнитьКод(Код, Параметры);
		Результат = Параметры.Результат;
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

Функция ПреобразоватьВСписокЗначений(Знач Коллекция, Знач Выражение, Знач Контекст = Неопределено) Экспорт
	ТипКоллекции = ТипЗнч(Коллекция);
	ПроверкаПараметров(ТипКоллекции, Выражение, Контекст);
	 
	Если Коллекция.Количество() = 0 Тогда
		Результат = Новый СписокЗначений();
	ИначеЕсли ПустаяСтрока(Выражение) Тогда
		Результат = Новый СписокЗначений();
		
		ВГраница = Коллекция.Количество() - 1; 
		Для Индекс = 0 По ВГраница Цикл
			Результат.Добавить();			
		КонецЦикла;
	Иначе
		Шаблон = ШаблонПреобразоватьВСписокЗначений();
		Код = ПолучитьКодДляВыполнения(Шаблон, Выражение, Контекст, Истина);
		
		Параметры = Новый Структура("Коллекция, Контекст", Коллекция, Контекст);
		ВыполнитьКод(Код, Параметры);
		Результат = Параметры.Результат;
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

Функция ПреобразоватьВТаблицуЗначений(Знач Коллекция, Знач ТаблицаРезультат, Знач Выражение, Знач Контекст = Неопределено) Экспорт
	ТипКоллекции = ТипЗнч(Коллекция);
	ПроверкаПараметров(ТипКоллекции, Выражение, Контекст);
	Если ТипЗнч(ТаблицаРезультат) <> Тип("ТаблицаЗначений") Тогда
		ВызватьИсключение "Обязательный параметр <ТаблицаРезультат> не является таблицей значений";
	КонецЕсли;
	 
	Если Коллекция.Количество() = 0 Тогда
		Результат = ТаблицаРезультат;
	ИначеЕсли ПустаяСтрока(Выражение) Тогда
		Результат = ТаблицаРезультат;
		
		ВГраница = Коллекция.Количество() - 1; 
		Для Индекс = 0 По ВГраница Цикл
			Результат.Добавить();			
		КонецЦикла;
	Иначе
		Шаблон = ШаблонПреобразоватьВТаблицуЗначений();
		Код = ПолучитьКодДляВыполнения(Шаблон, Выражение, Контекст, Истина);
		
		Параметры = Новый Структура("Коллекция, Контекст, ТаблицаРезультат", Коллекция, Контекст, ТаблицаРезультат);
		ВыполнитьКод(Код, Параметры);
		Результат = Параметры.Результат;
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

#КонецОбласти

#Область ПриватныеМетоды

Процедура ПроверкаПараметров(Знач ТипКоллекции, Выражение, Контекст)
	Если ТипКоллекции <> Тип("Массив") И ТипКоллекции <> Тип("Соответствие")
			И ТипКоллекции <> Тип("ТаблицаЗначений") И ТипКоллекции <> Тип("СписокЗначений") Тогда
		ВызватьИсключение "Обязательный параметр <Коллекция> не является коллекцией";
	КонецЕсли;
	
	Если ТипЗнч(Выражение) <> Тип("Строка") Тогда
		ВызватьИсключение "Обязательный параметр <Выражение> не является строкой";
	КонецЕсли;
	
	Если Контекст <> Неопределено И ТипЗнч(Контекст) <> Тип("Структура") Тогда
		ВызватьИсключение "Необязательный параметр <Контекст> указан и не является структурой";
	КонецЕсли;
КонецПроцедуры

Функция ПустаяКоллекция(Знач ТипКоллекции, Знач Коллекция)
	Если ТипКоллекции = Тип("Массив") Тогда
		
		Результат = Новый Массив;
		
	ИначеЕсли ТипКоллекции = Тип("Соответствие") Тогда
		
		Результат = Новый Соответствие;
		
	ИначеЕсли ТипКоллекции = Тип("ТаблицаЗначений") Тогда
		
		Результат = Коллекция.СкопироватьКолонки();
		
	ИначеЕсли ТипКоллекции = Тип("СписокЗначений") Тогда
		
		Результат = Новый СписокЗначений;
		
	КонецЕсли;
	
	Возврат Результат;
КонецФункции

Функция СкопироватьКоллекцию(Знач ТипКоллекции, Знач Коллекция)
	Если ТипКоллекции = Тип("Массив") Тогда
		
		Результат = Новый Массив;
		Для Каждого Элемент Из Коллекция Цикл
			Результат.Добавить(Элемент);
		КонецЦикла;
		
	ИначеЕсли ТипКоллекции = Тип("Соответствие") Тогда
		
		Результат = Новый Соответствие;
		Для Каждого Элемент Из Коллекция Цикл
			Результат.Вставить(Элемент.Ключ, Элемент.Значение);
		КонецЦикла;
		
	ИначеЕсли ТипКоллекции = Тип("ТаблицаЗначений") Тогда
		
		Результат = Коллекция.СкопироватьКолонки();
		Для Каждого СтрокаКоллекция Из Коллекция Цикл
			СтрокаРезультат = Результат.Добавить();
			ЗаполнитьЗначенияСвойств(СтрокаРезультат, СтрокаКоллекция);
		КонецЦикла;
		
	ИначеЕсли ТипКоллекции = Тип("СписокЗначений") Тогда
		
		Результат = Новый СписокЗначений;
		Результат.ТипЗначения = Коллекция.ТипЗначения;
		
		Для Каждого Элемент Из Коллекция Цикл
			Результат.Добавить(Элемент.Значение, Элемент.Представление, Элемент.Пометка, Элемент.Картинка);
		КонецЦикла;

	КонецЕсли;
	
	Возврат Результат;
КонецФункции

Функция ПолучитьКодДляВыполнения(Шаблон, Знач Выражение, Знач Контекст, Знач ЭтоФункция)
	ПараметрыПодстановки = ПолучитьПараметрыПодстановки(Контекст);
	
	Если ЭтоФункция Тогда
		КодВыражения = А_АнализКода.ПодготовитьКодДляВстраивания(Выражение, ПараметрыПодстановки, "", "Л_РезультатВыражения");		
	Иначе
		КодВыражения = А_АнализКода.ПодготовитьКодДляВстраивания(Выражение, ПараметрыПодстановки);
	КонецЕсли;
	
	Код = СтрЗаменить(Шаблон, "%Выражение%", КодВыражения);
	
	Возврат Код;
КонецФункции

Функция ПолучитьПараметрыПодстановки(Знач Контекст)
	ПараметрыПодстановки = Новый Структура;
	Если Контекст <> Неопределено Тогда
		Для Каждого ЭлементКонтекста Из Контекст Цикл
			ПараметрыПодстановки.Вставить(ЭлементКонтекста.Ключ, "Л_Контекст." + ЭлементКонтекста.Ключ);
		КонецЦикла;
	КонецЕсли;
	
	Возврат ПараметрыПодстановки;
КонецФункции

Процедура ВыполнитьКод(Знач Код, Знач Параметры = Неопределено)
	Выполнить Код;
КонецПроцедуры

Функция ШаблонДляКаждого()
	Шаблон = 
		"Л_Контекст = Параметры.Контекст;
		|Л_Коллекция = Параметры.Коллекция;
		|
		|Л_ВГраница = Л_Коллекция.Количество() - 1;
		|Для Индекс = 0 По Л_ВГраница Цикл
		|	Элемент = Л_Коллекция[Индекс];
		|	%Выражение%
		|КонецЦикла;";
	
	Возврат Шаблон;
КонецФункции

Функция ШаблонФильтр(ТипКоллекции)
	Если ТипКоллекции = Тип("Массив") Тогда
		
		Шаблон = 
			"Л_Контекст = Параметры.Контекст;
			|Л_Коллекция = Параметры.Коллекция;
			|
			|Л_Результат = Новый Массив;
			|Л_ВГраница = Л_Коллекция.Количество() - 1;
			|Для Индекс = 0 По Л_ВГраница Цикл
			|	Элемент = Л_Коллекция[Индекс];
			|	%Выражение%
			|	Если Л_РезультатВыражения Тогда
			|		Л_Результат.Добавить(Элемент);
			|	КонецЕсли;
			|КонецЦикла;
			|
			|Параметры.Вставить(""Результат"", Л_Результат);";
			
	ИначеЕсли ТипКоллекции = Тип("ТаблицаЗначений") Тогда
		
		Шаблон =
			"Л_Контекст = Параметры.Контекст;
			|Л_Коллекция = Параметры.Коллекция;
			|
			|Л_Результат = Л_Коллекция.СкопироватьКолонки();
			|Л_ВГраница = Л_Коллекция.Количество() - 1;
			|Для Индекс = 0 По Л_ВГраница Цикл
			|	Элемент = Л_Коллекция[Индекс];
			|	%Выражение%
			|	Если Л_РезультатВыражения Тогда
			|		Л_ЭлементРезультат = Л_Результат.Добавить();
			|		ЗаполнитьЗначенияСвойств(Л_ЭлементРезультат, Элемент);
			|	КонецЕсли;
			|КонецЦикла;
			|
			|Параметры.Вставить(""Результат"", Л_Результат);";
			
	ИначеЕсли ТипКоллекции = Тип("СписокЗначений") Тогда
		
		Шаблон =
			"Л_Контекст = Параметры.Контекст;
			|Л_Коллекция = Параметры.Коллекция;
			|
			|Л_Результат = Новый СписокЗначений;
			|Л_Результат.ТипЗначения = Л_Коллекция.ТипЗначения;
			|
			|Л_ВГраница = Л_Коллекция.Количество() - 1;
			|Для Индекс = 0 По Л_ВГраница Цикл
			|	Элемент = Л_Коллекция[Индекс];
			|	%Выражение%
			|	Если Л_РезультатВыражения Тогда
			|		Л_ЭлементРезультат = Л_Результат.Добавить();
			|		ЗаполнитьЗначенияСвойств(Л_ЭлементРезультат, Элемент);
			|	КонецЕсли;
			|КонецЦикла;
			|
			|Параметры.Вставить(""Результат"", Л_Результат);";
			
	КонецЕсли;
	
	Возврат Шаблон;
КонецФункции

Функция ШаблонПреобразоватьВМассив()
	Шаблон = 
		"Л_Контекст = Параметры.Контекст;
		|Л_Коллекция = Параметры.Коллекция;
		|
		|Л_Результат = Новый Массив;
		|Л_ВГраница = Л_Коллекция.Количество() - 1;
		|Для Индекс = 0 По Л_ВГраница Цикл
		|	Элемент = Л_Коллекция[Индекс];
		|	%Выражение%
		|	Л_Результат.Добавить(Л_РезультатВыражения);
		|КонецЦикла;
		|
		|Параметры.Вставить(""Результат"", Л_Результат);";
	
	Возврат Шаблон;
КонецФункции

Функция ШаблонПреобразоватьВСписокЗначений()
	Шаблон = 
		"Л_Контекст = Параметры.Контекст;
		|Л_Коллекция = Параметры.Коллекция;
		|
		|Л_Результат = Новый СписокЗначений;
		|Л_ВГраница = Л_Коллекция.Количество() - 1;
		|Для Индекс = 0 По Л_ВГраница Цикл
		|	Элемент = Л_Коллекция[Индекс];
		|	НовыйЭлемент = Л_Результат.Добавить();
		|	%Выражение%
		|КонецЦикла;
		|
		|Параметры.Вставить(""Результат"", Л_Результат);";
	
	Возврат Шаблон;
КонецФункции

Функция ШаблонПреобразоватьВТаблицуЗначений()
	Шаблон = 
		"Л_Контекст = Параметры.Контекст;
		|Л_Результат = Параметры.ТаблицаРезультат;
		|
		|Л_ВГраница = Л_Коллекция.Количество() - 1;
		|Для Индекс = 0 По Л_ВГраница Цикл
		|	Элемент = Л_Коллекция[Индекс];
		|	НовыйЭлемент = Л_Результат.Добавить();
		|	%Выражение%
		|КонецЦикла;
		|
		|Параметры.Вставить(""Результат"", Л_Результат);";
	
	Возврат Шаблон;
КонецФункции

#КонецОбласти