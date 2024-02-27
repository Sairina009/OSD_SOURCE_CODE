<?php require_once "header.php"; require_once 'mainnav.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $lang['PAGETITLE']; ?></title>
    </head>
<body>
    <div style="border:1px solid black;padding: 2px;height: 750px;margin-top: -1px;width: 1820px;margin-left: 70px;">
<br>
    <div class="card" style="width: 770px;margin-left: 55px;">
        <div class="card-body" >
            <table id="table" class="table table-bordered table-striped table-hover" style="margin-left: 30px;width: 95%;">
                <thead>
                    <tr>
                        <th class="py-1 px-2">DateTime</th>
                        <th class="py-1 px-2"><?php echo $lang['D1']; ?></th>
                        <th class="py-1 px-2"><?php echo $lang['D2']; ?></th>
                    </tr>
                </thead>
                                <tbody>
                    <?php
                    $kvmdata=new DB_con();