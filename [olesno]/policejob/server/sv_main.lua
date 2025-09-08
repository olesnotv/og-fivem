ESX.RegisterServerCallback('getHighestRankPlayer', function(source, cb, jobName)
    MySQL.Async.fetchAll([[
        SELECT users.name, job_grades.label, job_grades.grade
        FROM users
        JOIN job_grades ON users.job = job_grades.job_name AND users.job_grade = job_grades.grade
        WHERE users.job = @job
        ORDER BY job_grades.grade DESC
        LIMIT 1
    ]], {
        ['@job'] = jobName
    }, function(result)
        if result[1] then
            cb({
                name = result[1].name,
                gradeLabel = result[1].label,
                grade = result[1].grade
            })
        else
            cb(nil)
        end
    end)
end)

ESX.RegisterServerCallback('myScript:getPoliceBankMoney', function(source, cb)
    MySQL.Async.fetchScalar('SELECT money FROM addon_account WHERE name = @name', {
        ['@name'] = 'society_police'
    }, function(money)
        cb(money)
    end)
end)