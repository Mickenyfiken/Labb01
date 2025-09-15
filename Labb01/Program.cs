
Console.Write("Skriv en text med siffror och bokstäver: ");
string userInput = Console.ReadLine();
int nextIndex = 0;
int startIndex = 0;
long sum = 0l;
bool isDigits = false;
bool exit = false;

while (!exit)
{
    if (startIndex < userInput.Length - 1)
    {
        nextIndex = userInput.IndexOf(userInput[startIndex], startIndex + 1);
    }
    else
    {
        Console.ForegroundColor = ConsoleColor.Gray;
        Console.WriteLine("Total = " + sum);
        exit = true;
        continue;
    }

    if (nextIndex > -1)
    {

        isDigits = StringIsDigit(userInput.Substring(startIndex, nextIndex + 1 - startIndex));
        if (!isDigits)
        {
            startIndex++;
            continue;
        }
        else
        {
            sum += Int64.Parse(userInput.Substring(startIndex, nextIndex + 1 - startIndex));

            PrintString(startIndex, nextIndex, userInput);


            Console.WriteLine();
        }
    }

    startIndex++;
}


static bool StringIsDigit(string partOfString)
{
    foreach (char letter in partOfString)
    {
        if (!char.IsDigit(letter))
        {
            return false;           
        }
    }
    return true;
}


static void PrintString(int startIndex, int nextIndex, string userInput)
{


    for (int i = 0; i < userInput.Length; i++)
    {
        if (i >= startIndex && i <= nextIndex)
        {
            Console.ForegroundColor = ConsoleColor.Red;
            Console.Write(userInput[i]);
        }
        else
        {
            Console.ForegroundColor = ConsoleColor.Gray;
            Console.Write(userInput[i]);
        }
    }
}