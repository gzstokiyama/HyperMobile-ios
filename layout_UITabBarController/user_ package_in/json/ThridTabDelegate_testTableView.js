

var commObj = commKV("someKey", commValue);

// 点击行事件 专用方法名 ( section、row )
function didSelectRowAtIndexPath() 
{

    // 所有行点击事件都是 push 到同一 新 VC 带通信参数。
    pushTo("newPage/NewPage.json", commObj);



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
                    pushTo("newPage/s0r0Page.json");
                }
                    break;

                case (1):
                {
                    pushTo("newPage/s0r1Page.json");
                }
                    break;
            }
        }
            break;
            
        case (1):
        {

        }
            break;
            
        default: 
        {

        }
            break;
    }

    


    

}

