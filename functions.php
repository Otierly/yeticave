<?php
function include_template($name, $data) {
    $name = 'templates/' . $name;
    $result = '';
    if (!file_exists($name)) {
        return $result;
    }
    ob_start();
    extract($data);
    require($name);
    $result = ob_get_clean();
    return $result;
}


{
    function priceFormat($price)
    {
        $result = ceil($price);
        if ($price < 1000) {
            return $result . "<b class='rub'>р</b>";
        } else {
            $format = number_format($result, '0', ',', ' ');
            return $format . "<b class='rub'>р</b>";
        }
    }
}
{
    function lotTimer()
    {
        $Ntime = strtotime('tomorrow');
        $time1 = time();
        $dieTimer = $Ntime - $time1;
        return gmdate('H:i', $dieTimer);

    }
}
