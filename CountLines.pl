$file_need_check = $ARGV[0];

$dir = $file_need_check;
#存放文件夹路径
@folders;
#统计代码行数的文件后缀
@fileSuffix = ("swift","h","m");
#忽视的文件夹名
@folderIgnored = ("Pods","Assets.xcassets","Base.lproj");

@fileNeedCheck;

sub exploreFolder{
    @files = glob($_[0]."/*");
    foreach(@files){
        if(-d $_){
            $tmpFolderName = $_;
            $initialName = $_;
            $count = 0;
            if(reverse($tmpFolderName) =~ /\//){
                $compareName = reverse($`);
                foreach(@folderIgnored){
                    if($compareName ne $_){
                        if($count == @folderIgnored - 1){
                            push(@folders,$initialName);
                        }
                        $count += 1;
                    }
                }
            }
        }else{
            $tmp = $_;
            reverse($_);
            if($_ =~ /\./){
                $tmpSuffix = $';
                foreach(@fileSuffix){
                    if($_ eq $tmpSuffix){
                        push(@fileNeedCheck,$tmp);
                        last;
                    }
                }
            }
        }
    }
    
    $count = @folders;
    if($count != 0){
        $name = pop(@folders);
        exploreFolder($name);
    }else{
        countLines();
    }
}

$linesInAll = 0;

sub countLines{
    foreach(@fileNeedCheck){
        open(DATA,"<$_");
        while(<DATA>){
            $linesInAll += 1;
        }
    }
    print "代码总行数:".$linesInAll."\n";
}

exploreFolder($dir);