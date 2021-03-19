#include <iostream>
#include <windows.h>

int main()
{
	short num[10] = { 1, -2, -15, 0, 30000, 30000, -30000, 5, 8, 10 };
	int psumm = 0, nsumm = 0;
	for (int i = 0; i < 10; i++)
	{
		if (num[i] < 0)
			psumm += num[i];
		else
			nsumm += num[i];
	}
	if ((nsumm & 16) == 16)
		MessageBox(0, L"5th bit is 1", L"summ", MB_OK);
	else
		MessageBox(0, L"5th bit isnt 1", L"summ", MB_OK);
	wchar_t istr[32];
	_itow_s(psumm, istr, 10);
	MessageBox(0, istr, L"summ", MB_OK);
	_itow_s(nsumm, istr, 10);
	MessageBox(0, istr, L"summ", MB_OK);
}
