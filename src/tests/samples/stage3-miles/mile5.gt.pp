proc main ()
    int result;
begin
    call p(4, result);
    write result;
    write "\n";
end

proc p (val int in, ref int out)
begin
    out := 2 * in;
end
