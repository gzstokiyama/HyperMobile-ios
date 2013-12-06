
// 点击行事件 专用方法名 ( section、row  组、行)
function didSelectRowAtIndexPath() 
{
    // 多分支事件
    switch (section)
    {
        // 第 0 个 section
        case (0):
        {
            // 不同行不同事件
            switch (row)
            {
                case (0):
                {
                    pushTo("json/ThridTab/Settings01.json");
                }
                    break;
            }
        }
            break;
        

        // 第 1 个 section   
        case (1):
        {
            switch (row)
            {
                case (0):
                {
                    pushTo("json/ThridTab/Settings02.json");
                }
                    break;

                case (1):
                {
                    pushTo("json/ThridTab/Settings03.json");
                }
                    break;
            }
        }
            break;
            
    }

}

