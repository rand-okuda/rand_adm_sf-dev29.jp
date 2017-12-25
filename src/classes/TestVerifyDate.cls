@isTest
private class TestVerifyDate {

    @isTest static void test001() {
        date date1 = System.Date.today();
        date date2 = date1.addDays(5);
        date returnDate = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(returnDate,date2);
    }

    @isTest static void test002() {
        date date1 = System.Date.today();
        date date2 = date1.addDays(99);
        date returnDate = VerifyDate.CheckDates(date1, date2);
        date addMonthsDate = date1.addMonths(1);
        date firstDayNextMonth = Date.newInstance(addMonthsDate.year(), addMonthsDate.month(), 1);
        date assertDate = firstDayNextMonth.addDays(-1);
        System.assertEquals(returnDate,assertDate);
    }

}