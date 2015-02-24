import win32com.client
import os.path

def runMacro():
    xl = win32com.client.Dispatch("Excel.Application")
    xl.Workbooks.Open(Filename="D:\Data Transfer\PSPCL\Consolidated Input file\macrofile.xlsm", ReadOnly=1)
    xl.Application.Run("macrofile.xlsm!Sheet1.CommandButton14_Click")
    xl.Application.Quit()
    del xl

runMacro()
