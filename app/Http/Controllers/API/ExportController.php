<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class ExportController extends Controller
{
    public function index(Request $request) {
      $groupId = (int) $request->query('group_id', 0);

      if ($groupId <= 0)
        abort(404, "Не верно указан ID группы");


      $Spreadsheet = new Spreadsheet();
      $Sheet = $Spreadsheet->getActiveSheet();

      // // Set workbook properties
      // $spreadsheet->getProperties()
      // ->setCreator("Maarten Balliauw")
      // ->setLastModifiedBy("Maarten Balliauw")
      // ->setTitle("Office 2007 XLSX Test Document")
      // ->setSubject("Office 2007 XLSX Test Document")
      // ->setDescription(
      //     "Test document for Office 2007 XLSX, generated using PHP classes."
      // )
      // ->setKeywords("office 2007 openxml php")
      // ->setCategory("Test result file");

      // // Set worksheet title
      // $spreadsheet->getActiveSheet()->setTitle('Simple');

      $arrayData = self::getUserArrayTable($groupId);
      $Sheet->fromArray($arrayData);
      $Writer = new Xlsx($Spreadsheet);

      $Group = \App\Group::find($groupId);
      $groupName = $Group->name;
      $today = date("d.m.y his");
      $filename = "Группа $groupName на $today.xlsx";
      // redirect output to client browser
      header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
      header("Content-Disposition: attachment;filename=$filename");
      header('Cache-Control: max-age=0');

      $Writer->save('php://output');

      $Spreadsheet->disconnectWorksheets();
      unset($Spreadsheet);

      exit;
    }

    private static function getUserArrayTable($groupId) {

      $Users = DB::table('users')
      ->join('groups', 'users.group_id', '=', 'groups.id')
      ->select('surname', 'users.name as name', 'phone', 'email', 'users.created_at as created_at', 'groups.name as group_name')
      ->where('users.id', '!=', 1)// admin user
      ->where('users.group_id', $groupId)
      ->whereNull('users.deleted_at')
      ->orderBy('surname', 'desc')
      ->get();

      $users = $Users->toArray();
      $tableHeaderConnector = (object) [
        "surname" => "Фамилия",
        "name" => "Имя",
        "phone" => "Телефон",
        "email" => "Email",
        "created_at" => "Записан",
        "group_name" => "Группа",
      ];

      $table = array_merge([$tableHeaderConnector], $users);
      
      $table = json_decode(json_encode($table), true);
      return $table;
    }
}
